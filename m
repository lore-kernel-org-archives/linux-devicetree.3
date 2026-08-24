Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0625B083
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582407; cv=none; b=OKpkuNJ2OxVqTzEAMLlMNvN2n5ZdTctp1QPYjRWmvrgPYmIX3+CzffmrCel/4voznmyAghLTzRwDQusI1stOo1dn8wTA0p7Y44Txx93d7JF+ue1+/GzpfCM6p6ZMkQuxEhMNlGS0ha9Ika57VNSP5TXoH6C1rm4pn9eNJx+i0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582407; c=relaxed/simple;
	bh=ja2/bF7bEOwsFn8JiVt63lUk8RZYAuON470cHQA5fu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Atkh/Ua6EitUaxM1NIt2K/liaToq6Yw87kXlszNT9UqanV6aIvKL742GwtfQ9sfiDI1HFhPgY0SsKmX4V7n9ZEsGfUX95VWueb59lJiD8wOhaSrYDTuUTWYxKBx5VbvmmfmYlTfeoIAdWffWuJOHs0yX7LEi22RGCnwMgxB2lLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8KOpiTJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KT4aJHgg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8KOpiTJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KT4aJHgg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OD9Mx23103094
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFSdKwtvN9qDI+3vqSCVFtNdEXjYZVeFXR3vtR6Cuak=; b=X8KOpiTJmaZ9DHMZ
	MlulcRyUEU1yAHwhtOzbhKAzvVu36OW6TTCK6yyDdXZFKzgYdw8JDcgi5DxfP+bc
	3/4U60s9lP/ExjpH0iNnCojKiI6ir6afL367E4Oex/f+iutnOZZIODhTy1CqFdLH
	CHA3pAaXc5ROt26beNAnnxgzhF5gvce6WPHHjlHTySRgVX63BeUjYnmlls7xsz4F
	5faaQhYhhRtjC+D2+kYsb7BT2XX7daK44ZEK2W8RYZYcn/jAPdeURc0dUcjbBBBL
	tbp82Bou+Grf4sukt++hZ40i3loT6T0WDj0IdiKtniV6ATAKPpWAvtEa42qb+Cts
	UIu6sw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdgc1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:40:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7530aaa7212so110872137.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787582404; x=1788187204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFSdKwtvN9qDI+3vqSCVFtNdEXjYZVeFXR3vtR6Cuak=;
        b=KT4aJHggeD6HUmWLOzvdNbwJ1OT6onwny2BIeP+6d0pU9WbPr37Qt9CTo5r9iWLQtB
         sL/bKLCnWfKzLTiF/1p6CRz56y5gRiVbx1OT6FVbhLjzytMeR7xFjlm/Bzii5UzZRXmG
         aqEkqRwBE4gEFiU5D7by7e1I7Evga7txQlGeN/ScO9NufUkdTLHqqGjPU3xeWmubX6c3
         TcLVZLGMMQpsrF5pRXChnMjcA6Nx/L9YTka85emt38Nfwc+R49Fw6BS3dE+hjE0aIQkT
         x66l3548XiDWwz7GrA7uc0yU+8SF7+t8zrrH/J7NfadUL5OyeJrJBihUqiysGADFfie9
         jGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582404; x=1788187204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFSdKwtvN9qDI+3vqSCVFtNdEXjYZVeFXR3vtR6Cuak=;
        b=Q0U2E0zdK1LDNPDLimQ+QH5ApuumIQ0LHvANCkmAWbRzDDBRLqX05BkDH6aft68oNm
         McVmhRoELElDfUcqBEhL6ctcrzD9oCvoF0t1SkQZqAOxKBmEkf2nO0AhMS85g2TTwhzT
         4X404fXuWa8a7I87dPT/stTjeneadTn4XUEzNva6H18A2DYsYdwJRxNVV9J7PdYU3JK7
         CRa2qnfGpWJOmDJsx1i6vlJr9Y1dwADcc6B9HikgPJggMWQ+cKnZTNbyf7XTjvKOnod1
         zSeaNdMmf2K1DMtVKBsuWUnFp2YJxJJFeoDQZqd4NuQ3A12J8NC2KKPhO4k9ax4lVJeb
         wWJA==
X-Forwarded-Encrypted: i=1; AHgh+RpIlGTooL4r+3lwcFahe1wyt6HGlRdt1I6E4eau3HvLOFWa4ggyiKU3tM4Q4YLa+370GuNyETYbs8IE@vger.kernel.org
X-Gm-Message-State: AFuF++njRspg6ZnOfwY8HbYJnIAn3f4Son6bSypVPgAH/RGYBnbc+4M9
	fagEC8EZpyjwfk6URM7D4sc6Ke72N2l93D9lyIS8+PIEvi0DCKafC7def0WE3NV5lAsjS2kG1oR
	6lKbWCqRk46eMkaXkE/weZewMOZVUqwRgqecHrsoyylr2/52gB7eyYuZQcJIqR8oq
X-Gm-Gg: AR+sD12q2zQkpZ+i+cIiqCQw+oxFQeQ8V53X1vrJx/+2eYeW8QKScx18jWWnBnvhf3X
	qX0QuSmAZU80dWrKMsNBpKjW5fY9ytiWuRrRpV/qiNLFBeqAKoX4uae6AeSCWwiQxWJEWMDYDVD
	ssEmJp9KkMiZSFC9CpALpXyy2OVolfToboDBOb5wzGf17fFsO254ueywZNFERmsMJdS+jmmGZXS
	XsLpT3iVrLo5GrY0AZaU39FhQ7X/ifKKLJlVOajRrE19vTRBw6qyYVbdpK4ulB547BZTv3iOCot
	6b4mXJWR90qGrBLu6PzaY9vJXxLdbfBNyXCLg2C/n2rL8/8yd9XRD8LR69BZZT/eys1OswcrOEO
	SDQStunw9e8PeFdbt9nA7oVWi
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3521968137.0.1787582403929;
        Mon, 24 Aug 2026 07:40:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1594:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77a5f2e70b7mr3521958137.0.1787582403532;
        Mon, 24 Aug 2026 07:40:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1c3003sm8992565a12.23.2026.08.24.07.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:40:02 -0700 (PDT)
Message-ID: <6d30f908-b127-4f30-a496-d625e811b8fe@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:40:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] arm64: dts: qcom: ipq5018: Flatten usb
 controller node
To: George Moussalem <george.moussalem@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveenkumar I
 <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
 <8e175474-1275-4287-9101-1c54afdfcd09@oss.qualcomm.com>
 <SN7PR19MB6736BC1B0AF80D243B8C08E99DA02@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736BC1B0AF80D243B8C08E99DA02@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMyBTYWx0ZWRfXwyzCmocM+y1D
 fb6p90BQvUNTidWZiQo7C+gNWvwMmRTekpMVXV0ptyN3pcahTjnLo9KDJYddacozKD/uZfaSKNs
 zr8xB5rAXjgyTE7TgVZK5jg/0dCbn4w=
X-Proofpoint-ORIG-GUID: FkwFnpifaTUC2IqgQ2JKwMFJ26qU6m4e
X-Proofpoint-GUID: FkwFnpifaTUC2IqgQ2JKwMFJ26qU6m4e
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8c57c4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=f1ofXoCs9oobWTv4rbcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMyBTYWx0ZWRfXyZ6rcfHGL+fV
 IEMtkoXjnMbnToeP7ELc229rQKcbmg3eykKBM9uUjtRR3DvlDF6fw3Rr0JVIg9LYUD8jqy7CUwr
 /TfoLabj3tr8p6YqfHUHDGsc3CIDfU99losQehGmXjOtnr8As4tH0VCGdBFh0REuxhAAjFpFDhI
 5XuijdOXZqPG1fRXqt+18xtoKG6DOVXqw1+yd+V1IigzYFlXE6whm06sMfw2lMMbvY3gzma66Qe
 Il7iiWd4qZXAMowMs5uwW9DX+XGijmf83gTJJXz5aS6SiRT40cMUWE7a85uC4Jva4/b3c7pPk9Q
 9B08KI15WGbZ6jIQYcr+Z60G1xBWHK62R90NjTFczQlKefH/6F+0bWlHaNzHzYlxH/ftAX23s78
 nOoRgRpOd51cOIU/xT52rw66ld6CW9ty5AGeTkgK/3jzsbK84y1XqaV5QuYlZQUY3eFAd19w5qL
 RlIrljFoO1DR88ib6lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240123

On 8/24/26 11:26 AM, George Moussalem wrote:
> On 8/24/26 12:59, Konrad Dybcio wrote:
>> On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Flatten usb controller node and update to using latest bindings and
>>> flattened driver approach.
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Thanks for the RB tag. There will be an update in v3 relative to the
> size of the register space which should be 0xf1c00 to cover QSCRATCH
> too. Do you want to review it again then or shall I keep the RB tag?

Keep it

Konrad
