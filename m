Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444463DCDBD
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735933; cv=none; b=k+AywNrCMpKPoyL9IU/pawYytoQnvO9gvMhl+MsSIsBcGdsRc9YYHNCDarRSQjrNNCeGvbCA81rDJHo1ptJFCfCU56WveO9JRNrAwPHNgOgqOh3gexSkJE7BAIgI2VP9mk/sotofTIbaRpk7ad1iZ3Jzi/nLZ0bSzftxB76ve6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735933; c=relaxed/simple;
	bh=BBmzcHRttvERxItwEBK80w5VIKJ6lVAYxb1TAHNxcK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qU0CLF8D9ITWOdLso673OiRXndphoRtZgoyIf9vnB547l6LbeT2sFsomw1yaAhCoc1FkawwCaxh7KGnvn7b0IlLkxBiuYfb2z0TWysjP5wUAOBnlsSFWMZoaugr1a5FaDL5ZOR0LWBBwRo93z1UXhbazJLR+FPQTj6u3/qoVSpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGqBgQBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba0pBR3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGqBgQBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba0pBR3+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Ce2E4065783
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=; b=NGqBgQByz78n3dAq
	Qd3HNPEXJ0RKszpJeYm4NgejTKfSKJzWMdKu/a8ZUg7kxepi0oCw8uLukiJESjCa
	ifUySoNQ3Y4CnPibkWTK0KBtbAgkZJnC6vJppddDLOV7PLTBkkkmFZQ55soRHayn
	YojJWGYTSwxDki5rf/LllyMlS+KR7dFBqXYhcyYQ8EeG/MuOagvJ/hpgxFUhFro5
	ymIRsK2E5haxBr8bQ01/QrPnRhZAAyEajCzaXb2WFB/YYXY+brZPmRcJvp9oG9ti
	Yg3Se2GUSx/GX9vav5S8ZUupXtkqIrW2fp/OEoBPBN54/phZlHYxYSj97p2T065L
	20TOYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn34tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:18:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52e39629b97so318891cf.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735924; x=1788340724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=;
        b=Ba0pBR3+ft4LzMf6qZzOm7GHwuPiCWf/gti69VmwCCKQIj4GTJC3jG3JiEm7yxg/xb
         OpD9xUFyalCecMC34Ve0eP8hpHOaacOjrrPtauTBXd+MaCQ6VbiNCowxXXfzoCR7f6+n
         wq2vJkJbTD4KAUU9t6jX/OK8p6AB3o3DNGPqGYKerCFYU+Mzj5rvWxZKmdo22bp+g9bp
         FNZA+nxLPuWYU/U8i30+0mklpxeOL3vBwHvwqXTowBf0Q9cg2LW1YdCAxvtOjlzvk03x
         ys5Reu3B8TWSJhqRtRQHrYE5qTCK3RUu/37aKqduSrhSJvDJp7E+cys/Kq7nDbzHGpsi
         i5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735924; x=1788340724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbeKlU3h3Ml7mU3uofQYzGvjkGoEjt4CapIKFJfIvEc=;
        b=Wt03fgnHVNMp4t9l1VcVX7nLr3Nd02VJ87wsCcGcGIlrjgXeEPjUgvIbwBaYsx7Q51
         ymN7uiqhLD2vfgzivqH49FYhtFY5QpNoars4diwrPqkAygkvIiOuEF2Fi4OSw0BFnPvd
         gdnIiU1mM1P4eBMzIvIjRYt8khbpyXl6UuZapmjt0HL+XAqbRcVp2477/UyaS/NiVr7l
         gMcDEUM7yKpH4LutXnM2VMHSlhwkwCtFJTHOuzDN5pda8m/fXXZOar2gvt5HH/CoX7i0
         yCY4gx+WDdG2JRdOGyuJ8PguvE4VvIgXYDiDyJLrftltWb+N5uZ9A14y9Z+tIelTe0Ld
         2EOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxicxcuJZU3IfkJCr/7jfBy6QaDL6n1OC3UULHh+oOhcIIQwrha9YKlARe5SMvos8zidgeHSfqPqn3@vger.kernel.org
X-Gm-Message-State: AFuF++lD1RuQjV4gJpI7Y5Vn7mDVaZMoa1sY1eKGiQl8ghpuseFvYUR1
	j4dU2wm1Pp4zUy1BZ3CjBV6sh3waHoEhCrkC+dyv6iyJu1n4AiIy27KRpnWANLn2ECuOQCR6M4n
	ckOD6RMaTfmY9gaKTRc903ywICcQnP1XG97XdTzfVvCWHh+RypsKW2tB2DFX7H13s
X-Gm-Gg: AR+sD111T1sdcK0GXQnEeVaD32PZF4BLszXEW4wTMdECx+yjV61s1Gu1lM9WpzSUNzr
	cJUrr58nw2HKhtnKfYS+WrsPevv2FO90EQEAJxdZ+AphqbtVD/F8n8gwMCbc1SI+uZnHADfgMnv
	YyF2etfF5BUopeiwS/O4ThL23ylp6IKoyArkuFuIL3Ar8hepShA6hz9WaznRMdmlsy3Q4JTSZg7
	Cq1fXM0N3HJotA5395EYaWqDywVnOAIdh0rZBNJcgbPaAM8tZjcbM7TSD49uOYko/1tS1rnkcEZ
	ESd8jZk3pQz/Qt7GvmxpqzYqHXaFhwnnZ+9oqOhQjoS390BDcDHNpbdI376zfu9dsSHgDxIMi3K
	6uZCWMFRD8kmNrfgl25OjlfFH
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10789411cf.1.1787735923565;
        Wed, 26 Aug 2026 02:18:43 -0700 (PDT)
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10789141cf.1.1787735923070;
        Wed, 26 Aug 2026 02:18:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b235csm300936566b.44.2026.08.26.02.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:18:42 -0700 (PDT)
Message-ID: <28002a60-9a40-42d8-9583-947194da23fb@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:18:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI as
 reference clock
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BLtdjADHWqz1rkNnnlkV6Wb5wNMh4Era
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfX/zUOm947h5+y
 qxbPVN++Sioh3Oa5nS3G6kXUdDrJuArCT3Fc1IXVXQH4T/Zy+ZVUP1/7NLYS+EgXOCgGg3RPOtJ
 oVpkpiMYHXnAzQceFHOOxQcg7swFsdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfX1kNlfNfk0oCA
 hLRGU22j/s1/veHigjQnqzd2ozM5E2PWCemNz5k29LXnhCnVTxJsDUgHNvChc9QnQHANV18kftY
 f9GPNv4rNu6N3niVFFapjh4ypNEZhm9ughrSEB7XbCEJPBUbN4qCgOCtJAfQSQL2hT/hjKaVf6b
 7TS6o60gUNfZfjFPYGVHBZ5HiM7h65xI3Jxu1p/16LzwXspFx+ctm/3kfBemjsZnD2zZx982gmf
 zPsz319qmMn+xgF5soLdvRTXSh0LfZ6xVYlGr7c8bnZziox/lebhe6h/xgLbEtfskOwtuYPbGCA
 0fRxq4p9NYzBJ7t4/DYoEYVClsXL+BuZfiv3FLSgaAeFY5OTCN5Yfu2fuXnO2GXe6WkHGISiykg
 A8SLAEilLaEu6V8hPeKt6GmxrbklTs2n+2piZHAUFcp6VMGTGY5zcKvIWJgSO88AD6+XBSetBjN
 GLOvBr3luhDG2CjUj0w==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8eaf74 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=qOnNiLhTMCbsneYrw6IA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BLtdjADHWqz1rkNnnlkV6Wb5wNMh4Era
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260076

On 8/25/26 12:42 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
> 
> The clock rate is used by dwc3 core to derive the reference clock period
> and frame length adjusment. This is needed when the reference clock
> deviates from the hardware default (typically 19.2MHz). Above mentioned
> SoCs use different rates and, as such, the core initializes with the
> wrong values which leads to non-functional USB operation.
> 
> Read the "qcom,select-utmi-as-ref-clk" property to determine if the UTMI
> clock should be used as the reference clock. If so, set it as the
> reference clock in the dwc3_probe_data structure.
> The dwc3 core driver will then use this clock to derive the clock rate.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

There's a shorter patch in flight:

https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

Konrad
