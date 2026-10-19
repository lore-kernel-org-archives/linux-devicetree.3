Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450576;
	b=HIrCV4OSk2wTAqYW3T2TsZqczkbigc0sYrKSKxb0sZDKlHLhHUoQKErHFDXvg3mDx2E3
	 4sQMoc+/WOwG+QwOs4fL9NNq7Z20qEJwSlKjF2GGfgaRwaOykKXvtNN49xDGZYS2aCJ2o
	 JiXmasusZQ+T0NIs2cgCmjph3mlGKZGNmm/obUbD0AXcMhkC1Qg+o0tNVVy5n+y1DpOyR
	 sYSg+wKlbCo2w627qusJbltM2vmvcXz6gdWuYBpiiRLGGmf2eUPmTI3lc+ndzJPD6k1eU
	 F3ilRCjmLIVjVfazKdUtQwu0wty0bpgTkEGR0w0aPPNSCL35Q6TJ0INkyu1rsbuyirw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
	b=zjlBOVHMtmmZIGpbG+cH7N/j5qsnDiD5S90OaEnTtMMm8lhdYfNigO4GFxLvWAxUZj/z
	 SINlhq6mlSSeLfZ/4ZMWpoNDBIU5E2PBZPbsaVpbA3ISSwpYnuG0u/7KxYrE6c96aJqCk
	 FYhxg773m07U0Ob6iC1OM4JGIPNSdgObiEBmdojRN6JldZD0Vge/FA+1LPt+y8er3oKY9
	 yCyUsaXxNPaIvjYkiYtpZkym85yPxdSBcexV3XEmeJDFqP6gCQT6e4zvrpiFyi6xTFV4b
	 KQ8qJqVxWoXRsPw+JcGUpc0WXxCLqmyG5xPGl+8kdv5/3mAi0k+NaZ3jaf4wIZ5xORA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPD4U1pL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RM/6oeEu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13297606A31A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 22:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13297606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPD4U1pL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RM/6oeEu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLaH8o2892901
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=; b=ZPD4U1pL9YDcuEgT
	jupiJVi6G4tVmwh7ySlS2n5pvnbzewTfF6+YGf1q0twWg0NQAIIyUPEkMAUc2Gew
	jVVZZIZGkeeuHaDGtsPymIgLUMwLUcBhz3HZgEd4QubCoUEKxyWszm8uJ4ubLm/I
	u5dguqWtpJWlFykb+e+QXZ4ukLl0VND0s3L+ZAKFjd4w9hJDt2PG+sgs24z/WzHc
	pp0JOB9yK0lWVIsdbvFkrIs0p0EOlOlD6wu5oINLtYDxBtIQo+avzImffnsnSjZI
	CTsNogRzC/5cBNHeU3QRz20S/BMSrtXhKArXbAr9sk/qqGV9KpC4DeK6j1nfjb99
	Km8wOw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4a0y5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 22:56:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5433405eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792450574; x=1793055374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
        b=RM/6oeEueDtBfSl1qWx65vX3YEajsp+K5oPstSZfbJrJ62StbRaFmjnAa0njkwGqsQ
         VAWAfxhuxuBBlXiypreh5iG7PjLDh1wOyZxM52Zdf2hVekH+Zzl8TNbGOntQfscKa0du
         kHwOeD36BLzDKXHdQLvQ9grcIJjCUUPp8Y7ntUM1afqgLtK4TGtgGbl9187JEZ/JBnQZ
         Efa2UlZ84Fh6S3K+UR74uU/pRP90ZK75uzBhrEqwJJniMGcqq0HWfSqk9cDwEb/m0rBi
         EOAkVXhgF5warnC9+IURC3oyzjimxRKNSPECN6tClhubsa400clg/qZh2ckuSY39Tqih
         hCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450574; x=1793055374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
        b=GE5RMv4gQAgFjR1HDgjagy5j3xwTl3k5gnwXc/k1Uz+y2Cak6/aZN3bF/EXPFStn3q
         KWuXhxF4W2QtQGInq8/xzJKkb7cJ3fT70QgSKAt6nx0IejE9GjEKQTRykIoWFNySSQgQ
         IpmrFNnUWsSnQpJubQ+Un3O/vT8kYqspgQxI3jVHDfidW88qiyeqoOfdJBNGgV63VB+T
         SMXIzFlhA3uBCTslY3NQqaP7XkmQjhxyVCb631625up3hfz1jM/yy4VsjMoVRAs839iR
         dB3OGsDnnHfj1l/csKHwSmETgGNg0c72DP7gtuUXhTuvzyQrIRsM2iGqS34ar1QqmwH/
         e9lQ==
X-Forwarded-Encrypted: i=1; AKwUvByAd+ATTJabXy+Hx5lQ+7lYCsLqn4XyxWGOvktpxuhp6Gk1Pwu1yfDA4jjWhbozRDuHaaqsxUHKRFyV@vger.kernel.org
X-Gm-Message-State: AFq9FYKJwqBcNasB8ATRWSH5RdSY7m6xQYmUkRATnD/Q7QD9Py+CLA23
	OCxbrYePNBgT6OJPCsrMhJBFXkmfS8F7WZADpiravtw3o//+o5jvYD0lxEW1O4DSswe0JjvmQgU
	CX22Vsttb02B92W5S/s4pyWrMJm7Z26DkAtH9uAVAG5JmdZ9qjDHPxpNSlDeAo9Wd
X-Gm-Gg: AYBFou2J+GMcmd4Jcgh7gL8AB1nfIHuwub7uq7I8SE0QJTz1Xw+AXg+i7qBIs+tjmcl
	xZ6wyn4OrJdeuNJKwO+nz0Bb4/F2KVbX/ZEV4fjz9i3mtpe7asDBDRPVNhB0n/XkORmiNU/I3Dx
	9BtC025423LHCpSrVaZLQDnA7cj2pgP5p8mFarjflIIaB7uuzIsE2dRPSLIkPxwXOLFZLr1mJIQ
	YyYIu8H0BxvZZ/7D4jkV20K9n/VCb6489SF4UC4s4/sN1xhhwIF9/IroWy92oc3wlWkxMBjBmPN
	q++6dvvZXaeRnXGHkW77TulEPKcG8DWip0pUInUNE2lkEGVfGXgMdd5CbJ0DqP0wXS0Qp73cIMS
	VKmaK5X0NSL5Z3L+iqL5daEi7VGVl6t1WcbeE+JBXvPE60Kp4lKlNunqH
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr12257694c88.17.1792450573741;
        Mon, 19 Oct 2026 15:56:13 -0700 (PDT)
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr12257661c88.17.1792450573198;
        Mon, 19 Oct 2026 15:56:13 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm35737062c88.4.2026.10.19.15.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 15:56:12 -0700 (PDT)
Message-ID: <bc790885-bb5b-4dca-b5f7-5c338b809f21@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:56:11 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: qcom: camss: track PHY type and scale link
 frequency for C-PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
 <31bec5eb-97e0-4667-ab6e-0de662f97633@oss.qualcomm.com>
 <26e2a1cb-d792-4ca2-8530-865ebb887eb7@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <26e2a1cb-d792-4ca2-8530-865ebb887eb7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MSBTYWx0ZWRfX7/oQE8/lRqHF
 ESfFgPYMlErzGK5uD/aES1cuRSBAMU4TORYQgP9W1D2JOdwuEkGEZdLVAut1Dtj190As0qSjVYo
 7vWTAupnolWa2O1Xpl1sg6MYoKgtWyM=
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6ad6a00e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HsCFRf_u7LXHOK7ic58A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: jAaNHama1t9f2O6upf1ceyGegahNfrJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MSBTYWx0ZWRfX9zHDPWpeGzII
 1+Octi7Q5/PqB8u2hPo0vWH2YJJxl6aecymE2lRZSHta2XWoBrNqSmWOkmis3k1ryegxwKoxyos
 W3PtHnQPBwQwOSax/1fOhJMI66qfMInmL448aZx3WbbNChs6cgNogAXgPXdO2uCwrS7F+O7MD5j
 doEYG8UtqFR7Rv8649y3u++ShYY3uOuTYVd3ePdNrX3NFn9AhaEfMZxaShYISEhwTqEC6xM7QRE
 8UT7JUcfUtIa5BiFHfwK+QOEH4qduix77qS7ajW65TSOTbhqRRFBVpvpl5VxXdpxQDNt0be1r8o
 cfnlcgCSO0MN1DFv9id0Htd3NjxU2SbnplxX6vrJrATOkItB8cbEBgvi2J9v00MT6Yx+W9e6+ea
 2ZfmqF+odpyhZr4TOfUWjui8iUiUuBGDevqLvzJBTZQ39CtojzicJYfwrxX7dsvraNB0ysSNBP4
 XZ6cXuhvL2s+zV1XpAA==
X-Proofpoint-GUID: jAaNHama1t9f2O6upf1ceyGegahNfrJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190091

Hi Nihal, Krzyszto,

You're right. The driver itself does not depend on the DTS. Apologies
for the confusion.

The Depends-on was included purely for testing purposes. During
validation on sa8775p, qcs8300, and sc7280, we needed the corresponding
DTSI changes to instantiate the C-PHY consumer nodes so the driver could
probe and be exercised on real hardware. Without those device-tree
nodes, the driver simply wouldn't bind on those platforms in our test
environments.

Since this is a C-PHY consumer driver, the DTS patches are what enable
the PHY nodes that the driver attaches to. They are a prerequisite for
functional testing, not for compilation or correctness of the driver
code itself. The driver is self-contained and will build and function
correctly independent of those DTS changes.

I will drop the Depends-on from the next revision.

Apologies for the noise.

Thanks, Anusha

On 10/17/2026 10:35 AM, Krzysztof Kozlowski wrote:
> On 17/10/2026 19:30, Nihal Kumar Gupta wrote:
>>
>>
>> On 17-10-2026 09:22, Anusha Arun Nandi wrote:
>>> Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/
>>
>> This Depends-on is in the wrong series. 
>> The driver should not depend on the DTS.
> 
> Good point. If dependency is true, then this patchset is just broken.
> 
> Best regards,
> Krzysztof

