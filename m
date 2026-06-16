Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6458D360EEA
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613556; cv=none; b=d+qRI7cAK2rosa5ejpfca0dxCstzy/kCY2Aw9jWWpCSnQs4X/QzT07Wx6rrsCFYPLv1Oz1LRM7eKYHmDQ8UUY1zBpzp/KpXPQnDUmyjt3wgqOz0ZYqDIreu5RSEcd/bG48nZteVJ1NJx5POsVcmP96RzXNd/GfmpB0j0zI+7qj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613556; c=relaxed/simple;
	bh=2cN8pStYk6HKFKvoeomkej232onlU4BhbtiKFnBUqI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSTbJQpVKAQ8dGSakQ6KkYimumHauUC7QynPSaeerGQRXGV5NI0unl+5d9NLHi1fU+HA82f1aEBUsvoTMVIO/uOFKp2BzxmRiUckcki3+pMLV5WAPJkDSlOyQ83i27Mvn5r7stmCD5GCO+296pluE3rb6I8ZUT3vCog4142Saso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5vv13/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsBPe7Az; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5vv13/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsBPe7Az"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Bkn248163
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1jDeroSRDCDzCHfL9jQEPFl5rUbO6XQjWCdkBFa8AU=; b=Z5vv13/QhbtcBOAn
	TsL1rTBs5rgMe1o7xH3JiIxt5JfbVf1uaJAIQk97ysIeo56rxEIh/ekKs+FEBb27
	0PfQ5QzJXTSpA13oBgLtvmUzHjIwTGCxWnzLmw27vueEBTtzuwIhwvoe2EJdBhV1
	7eyVu0fmdD88ShtS9DuJ827LcpT2XCUb2CDHV7/XPfZ8B1ZdCldWdYlWQdW2gCLa
	hLaGFK3TCbx0i8Ps39fLDyUBCmAjnjO5ErBPiEvS48u7QftPlLZ5jIlLjAcHjpmM
	14HM+z5UzPZquxguBxTUdZ8285UM1+qtHDPcf1PvHtLWY+2TTfQrQHq2MJpGyJb+
	NkUZow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs91d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:39:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so100129185a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781613542; x=1782218342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m1jDeroSRDCDzCHfL9jQEPFl5rUbO6XQjWCdkBFa8AU=;
        b=QsBPe7AzScWvseC3XDi5PX3AOpTyTWhRJsUXUdJmhGU1CGduCMM+NvWQAC6vdIMpBw
         pWB0jNH+Xi7VUB8YaSn+kA/s5qG7FMip82A5RsoYePo1z76hqwHuc84w06TEd8FEwjg/
         ljN1TbEaLcWhiht9M5s05MsqVcQeK8KAPBh31yXcd2b8fHLYPLFzTKf3uM/QkQgHMTm9
         w1U1SL9Ziv2LWP6QnRySgUy/TOnGSfLt9tnO9RqsDnr1o9k44L06QRq7u4k5ZcgcnXfB
         0eYIdmeuldGNmUPUFy0zwGIL1N4HxaNgYtUY9B7uRL5XEQ4645x66PnWVoVSu+ULQV9U
         iieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613542; x=1782218342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1jDeroSRDCDzCHfL9jQEPFl5rUbO6XQjWCdkBFa8AU=;
        b=iFNiZZgg9rapZOGz59FKzGAAm97GjHMKSo0VTFHSXTU8840y2cikRI896E7Va8R+1Y
         hVGZBwAZztkHpV1zJJukxa0VjFIGK6Wm/TkQZhHkXN4+giE+SYp1fGJ3s9A1KjhEjQ9T
         Ip1itlCOx4h1sWKegbJOFEkU3o5MpzsamRsZv3ea1qnJFIQDDG2cJFU3FHwmeAi9rQAn
         q5Np8FbNrTpAxe2TWWufn2uGJouA74jmQI7k//yyM2CElINDXwZVshGkhPtIknRhWhrl
         uYqFKR3aSLvV8el2Qi4rIGPd3p1oZfULZOO5CnAyMSMSXg/foPRzr96wjwj2bLrJ8eZV
         RJTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dh8WqJCPE11rEAr7xBOJRLYttu8DXeyP8vSyd93yDcIqwe4kGue3CpBPNj5FTf5KstHWWBLiKaLB+@vger.kernel.org
X-Gm-Message-State: AOJu0YzJK7qCKiZi3EXc1wfP/x56QAbFj9BKedGox2OPlKCy5RNe/EJh
	A7NO4065SqT5KBbHeTAPELnn2XVZ+6uquEqor/VPYEf+VSLLFRs0qrqRAKEgDLQsuBj6PthRclU
	ycNn10irTJuAmgcoN/auqIUezI9c/sWp5EmYAjVhR6UvqMr1fpNGA3QCQQOjHMUlM
X-Gm-Gg: Acq92OF4pUBusHtAfXQDwV3/0ax3EG1QYhwBRfcIwdhU6rwzdLVSHoo0JJ5WP6j7QZd
	sdmhDUKlQAI0oN6s39Wl9OnQxBvlakrW48Quj9nUS7mhUowwmLkVsGqdzBsqG25vqipQML4YEHD
	mjaDANY+fXbrQMvUn/GVAwreJMjCfu6ivz+dEbzm9LIrvgAOdoEX3RJouHe9Hz1bu+rxxgxwqxc
	3GLIreGRCt1SOuA96O4pZ4VBoLL37hxSIRcUnvz0XB/upNjgDq27YQs3iUsxHHGxFFvVc3kgmXQ
	JfEDY6oFs5SKETBlic3ZMmhzSo28n9jZS64GHnmffyXNKYzDI9i39BMwZjKKbUzkjNoV1XA9hSX
	A4T/E37RlisIuWRo8fD/w9HCgBPGx9f4gAVUR4dU5Yllfdg==
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1845809885a.2.1781613542000;
        Tue, 16 Jun 2026 05:39:02 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1845792285a.2.1781613539676;
        Tue, 16 Jun 2026 05:38:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341840sm650145666b.43.2026.06.16.05.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:38:58 -0700 (PDT)
Message-ID: <d291a679-e8c6-49c7-b526-46a233c510c9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:38:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8550: add UART11 node
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-4-d5910c801756@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-pocketds-v3-4-d5910c801756@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aR473XoLTuo1qlhq36-yzu3sb8obG0dn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyOSBTYWx0ZWRfX5NRkpGw7p2PC
 BTU+lPmDK5inbyKDaF2DylgzFdMWYpD7t2u+SFxBo6nSzUzZWCnBLL3XIsM5DLMlvi15llAlK6f
 WjUhyshUWYz7Tie6sMamNqlR8O9nwPf/fHsyfDl3KasGHwjIZrJHprJ2aPDjz2llV9/HL4Zkd2i
 c96vJ2YCOfE7j2whYFWGYzPqXPy/zAe2v0UdyyFD+QKjOGoYUTGvrNC9JQiGAW1tAZUWkjJECBv
 x2/Vtge5nhYxmSd0648WH0DBOS281Cf5KeM7o3/4ZeNHWIsjhsQGQGRriMJow5ZGwSE/2wE6toR
 MQ26PPj7yY2aA73G+lJ+oIGt5Ao+4mZfMwc/J26nXDLgWjk1caumeMmYzMA/8I8r96iwHaatk0o
 CAdUZGkGMWiAbQUhVGMDyU12OCON1KoYEVFhJpRwRSMJ+DnxxlWZWiyq+XlMOYBnw1NWTUdAVKH
 8Ktmgd7gFk6htL7Mrjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyOSBTYWx0ZWRfXypPfvxa7Pgt/
 6qpgY4oByfoVuxj0yaBagaByITqvycj0OpUPkK/bCqevh/jecPX59TO8/Mvrp1RlrWQZE+drNf7
 gc8GpVtcqfnFVG9BAAMgiwJPBGRtAw0=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a3143e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9N7u2682LvJSGfYhleIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: aR473XoLTuo1qlhq36-yzu3sb8obG0dn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160129

On 5/17/26 3:14 PM, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add the QUPv3_2 SE3 High Speed UART (UART11) controller node and its
> default pinctrl state to sm8550.dtsi, so boards can enable it through
> &uart11 instead of open-coding the controller in their own dts.

The latter part of the sentence is rather implicit, that approach
wouldn't be accepted


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
