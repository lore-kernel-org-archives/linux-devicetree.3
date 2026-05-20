Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C303988F1
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291591; cv=none; b=MybtB6wL6pueE2WA/IvDwQtjXTEoF+xKWaMfUZztpuxHH6Of0MObEUE3xvH7T0PVmtsdviMVsp6D6hw+LouMpFPb6PeLvV3qbZyTc7sPBoORWx/z8UdDAu+83rRQa7KX6E4jkEQtAWctSBcbFCQIGntEr7+IorARGPh/nNuAsKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291591; c=relaxed/simple;
	bh=Nr2JR0dpmuWjfz/WKWJ82bULQ71y+4zZb6kDz6jYenM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=ft2roDd+6p89aNaPpJiwqWb1/TegpgQEAMdhlQdgBnkn+glKbdv2zEb06XOOEsQW8GSNxO1qXO/U/5XdcDCRFdPzEM7oRoQc8nsB1o7Hqz68rXgcAAp+ocN07qcr1gMbxUSUkmTaSrWx750xHOtXDDGn1xl6YA2jG8TeoQkFzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3lKGGOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LisuZ38h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3lKGGOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LisuZ38h"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2OSx826609
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KDEsJl+ouBVmHeKEwleH/vX4
	IKf0Y5kx3a9fe6U5jtw=; b=A3lKGGOyHVCC26b/kKVZSeKENVLeJuhALwex6RqG
	Of4u57otpR+2/FQuIvvyMZnuRB6s7phqVB+Jhp29axK3V107G+owsh1Qq0Kmc3eD
	b9w7gT1kgl0ub9b+CpGpq/DNCtjjTVYiKdn/xTsuPpmQ1CCewTmwFlg/3KRqzRGw
	c2yCZzKlaQSgtiQ++mE0qYMb5BxARRK7xAG2lBMdBckYjkeJ5gqgmqjuQaIEWR/u
	9RF2CUmJ2DMJ4Vm/I5LdLRakXAygBE7yhM5eRrW49jpGoVXwolkKE4W14b3b0dGN
	iD1rzeQLM8eVJEIE5bBkEyBRlAM5/3SjdR3OfHTl3KxHbg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecagdy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:39:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6312aa1d7adso4176510137.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291587; x=1779896387; darn=vger.kernel.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDEsJl+ouBVmHeKEwleH/vX4IKf0Y5kx3a9fe6U5jtw=;
        b=LisuZ38hB33w6fTjcJuroNKtkOpEhJXCL1fPez2xhm7rn+dBb/nSWyvHI+wsap4dWR
         YF7tpQB6y6xTz3YulCAwv8LavM00YDtNao9eLNmg69mmSJfY2aH1HBru7XvCNLYlrSbx
         L/SEHV+LBhpLDnw5z/I4vFldnqX0/6lGfArxcg7DPO7kqoZsiKqeY1CdNlkAqBlCyJot
         dnRewB64CMCJMpbRPHaSfIMC6SrSuQtO7AKW6DP9NtmEb9fV8Xf2FytbYR+Ug9ro3IEA
         ubtPxTiYVJ6XWV245L7Y7IDYZTBTeDfLC/bgUKRi7fjfQTA9A6JoMbP/+QY2XHBVghdt
         5UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291587; x=1779896387;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDEsJl+ouBVmHeKEwleH/vX4IKf0Y5kx3a9fe6U5jtw=;
        b=c/h1IrAQwEUmTuOBh03bqz/zdhKrH2mVpG13ETzjrivzOWEkOvwELidoffdaLwGgkg
         wzul2FYUT/Og46AEMM6GqQR4ZQgpC/491LJ3/BOA7mvq86E/1EUAoVXYS1ltTfjmlFqS
         0fJ0uXR3LE6lw0XjlAtWp5x1QQtFfITDLVgKGoT5ygYKuN1G8bYkVxj4kQdZGHoD4gCm
         sXvBS2iP65A2egqVF8SJav25Hmeri7E70bzPW5roDgAVk0DYR2rdmtoK8+RHGPRMqIXc
         T5HeR9sr9fTAWgDyBJTfJBAmL0q0n4FsbOucs9+UMDD3384HfyJbvZOrTxZp5WZQPqPO
         BrFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8N9VnVhjZ8qFm2orjRUouGSCHpiv27CQcyJwMAQkFahnoJCEDtuvm8Xf2n2t9/nevnHbgLxO4i8IJN@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0eGNgdU3VE4McRx7ccEXcDiD+20nZohm6nUBo9O+I3FB3y7x
	6SpaZe0i3BkLgR2WuvHbl3NH3bFTXKirqA1TyMxln8zzzLoRDAG0kf9Q5mXH9MD0XOayxaz9h5l
	GwbV3tb/T5PYB2qX2FAJwk1tVGBWTwNIP0NzkVF9zfe7yFbpaqe1gCvv+F9RhPKG4
X-Gm-Gg: Acq92OEfsnu1Lcs/q5kcttfYIk1MCYgfKGCGHgGIyWjZtfwsnvlddovl0plsFHKXyPy
	f+evetL3Z+PeY/TyEYH6PkhITzheh6GoMbnYUbEEn9bi41/+DsT6uC2MW4yjPPETJaHp58KTfz1
	ZccOGGOAa78/5OS3Au/NCR69u/InIkXGfh0z928J1SDySUyG4jJ3vMN7gb/C0TtEe1LMf8GumqT
	Slcy0X5ngg4KJY41aFwcDvH+IVXEOntrKpF04SBjqdJ8jhHlIUl26hlOoNHQgcqxzCZZ2Kv9cI5
	xhtTI5roKp33v5ErfiagHfv4zdaSaq0n2kpNm9N3pG4B6gsPIYvIUOjFY6RPk+ca0jj7DkfVwKp
	KbIEMD90+0DANXaeDr3b5UeBahkT6KI6leT7VmRspb+uoW9OJjw9mQlykVAuiqfjL0AGaef17vm
	HJaQrei5oMJsSMOll1iHRN4aQpQWfOwW2tdgzu4pQwjgRn6RLDIHIe9FWluxn+tq3u8OfugBXgZ
	F/MyKqEJjembIk7
X-Received: by 2002:a05:6102:3752:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-63a3fea4735mr11679103137.23.1779291587057;
        Wed, 20 May 2026 08:39:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3752:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-63a3fea4735mr11679054137.23.1779291586517;
        Wed, 20 May 2026 08:39:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c2a68dsm887643266b.18.2026.05.20.08.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:39:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------3AmKf01MW2hv0Vhzmru0T8mx"
Message-ID: <038fc58a-7233-49b4-822b-a6d99abf2382@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:39:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-13-bb1055274603@oss.qualcomm.com>
 <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
X-Proofpoint-GUID: SrbIHx5mNZP8srnpGJgZtxD6ncZI1lj6
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dd5c4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=r77TgQKjGQsHNAKrUKIA:9 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H1Te7B14W6HF1q1WNAgA:9 a=QEXdDO2ut3YA:10
 a=wa7H0P_oPzXo1QdaWhUA:9 a=B2y7HmGcmWMA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MSBTYWx0ZWRfX+63ry0WYWQDx
 HHgc/5EVBwhAKIr9s2zKT+qdx/va/avTrNEpvZScrRN0DodG0fBAb4X2wvarNLcGQGagZ41d8Uz
 jkkjuVEgBm/V511Y6nLxr1k8Dc7RM6QUerJgZcRIoeYKXfuxyBLHArUbIGsT3A/r45oqC+XdYbj
 Gy0etVOD+DT4owO75GYvBoQR8/nVVeR78YG890XuExmtbvyoqSO1JD3z3pdprrfm+FGqPbqcM9x
 t5fk81jjV0fUCPbOztAHd6+2MuuWpRtP9+0SG4WUvS6hfxxLdISiKEV7FLQcfsPgtX6JLCS4wM/
 8PP7mfWHjpvCiywFYG3UsgH7hIUziV6W2+xyhr8sx2iOHrt1MFGwmd2T20zg7pdLmJuOkuFfmct
 jSajT+hwo593akuoL63fONpKJdFguLNCvtSLJEqmGHBwQCDbhmAGuUC67m52uGSdFwICKzNGJjP
 IR8G1p5hiAu1Ik1RXSw==
X-Proofpoint-ORIG-GUID: SrbIHx5mNZP8srnpGJgZtxD6ncZI1lj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200151

This is a multi-part message in MIME format.
--------------3AmKf01MW2hv0Vhzmru0T8mx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 20-May-26 17:32, johannes.goede@oss.qualcomm.com wrote:

> 4. The v3 driver limits supported capture formats for the ope_disp_output
>    node (ope_enum_fmt_vid_cap()) to those matching ctx->proc_mbus_code, but
>    this not how this supposed to work. For media-controller centric
>    drivers, userspace is supposed to be able to enumerate all supported output
>    formats, as well as output formats for a specific mbus-code.
> 
>    This is controlled by the v4l2_fmtdesc.mbus_code field, if this is 0
>    then all formats should be returned and if it is set then only formats
>    which can be outputted for that mbus-code should be returned.
>
>    No active driver state like ctx->proc_mbus_code should be queried,
>    setting a compatible mbus code on the sink pad which is the source
>    for the /dev/video# capture node is userspace's responsibility.
> 
>    Also see:
>    https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-enum-fmt.html 
>    "Regardless of the value of the mbus_code field, the enumerated image
>     formats shall not depend on the active configuration of the video
>     device or device pipeline."

FYI attached is a patch fixing this, feel free to squash into the next version.

Regards,

Hans

--------------3AmKf01MW2hv0Vhzmru0T8mx
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-qcom-camss-OPE-Fix-ope_enum_fmt_vid_cap.patch"
Content-Disposition: attachment;
 filename="0001-media-qcom-camss-OPE-Fix-ope_enum_fmt_vid_cap.patch"
Content-Transfer-Encoding: base64

RnJvbSBhMTMzOTI3YzI4ZWQyNGRiZDVmZWMwYjQ4ZGU4NzE4ZTY3YTBhZGEyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBUdWUsIDE5IE1heSAyMDI2IDIxOjQ5OjA3ICswMjAw
ClN1YmplY3Q6IFtQQVRDSCAxLzJdIG1lZGlhOiBxY29tOiBjYW1zczogT1BFOiBGaXggb3Bl
X2VudW1fZm10X3ZpZF9jYXAoKQoKVGhlIHYzIGRyaXZlciBsaW1pdHMgc3VwcG9ydGVkIGNh
cHR1cmUgZm9ybWF0cyBmb3IgdGhlIG9wZV9kaXNwX291dHB1dApub2RlIChvcGVfZW51bV9m
bXRfdmlkX2NhcCgpKSB0byB0aG9zZSBtYXRjaGluZyBjdHgtPnByb2NfbWJ1c19jb2RlLCBi
dXQKdGhpcyBub3QgaG93IHRoaXMgc3VwcG9zZWQgdG8gd29yay4gRm9yIG1lZGlhLWNvbnRy
b2xsZXIgY2VudHJpYwpkcml2ZXJzLCB1c2Vyc3BhY2UgaXMgc3VwcG9zZWQgdG8gYmUgYWJs
ZSB0byBlbnVtZXJhdGUgYWxsIHN1cHBvcnRlZCBvdXRwdXQKZm9ybWF0cywgYXMgd2VsbCBh
cyBvdXRwdXQgZm9ybWF0cyBmb3IgYSBzcGVjaWZpYyBtYnVzLWNvZGUuCgpUaGlzIGlzIGNv
bnRyb2xsZWQgYnkgdGhlIHY0bDJfZm10ZGVzYy5tYnVzX2NvZGUgZmllbGQsIGlmIHRoaXMg
aXMgMAp0aGVuIGFsbCBmb3JtYXRzIHNob3VsZCBiZSByZXR1cm5lZCBhbmQgaWYgaXQgaXMg
c2V0IHRoZW4gb25seSBmb3JtYXRzCndoaWNoIGNhbiBiZSBvdXRwdXR0ZWQgZm9yIHRoYXQg
bWJ1cy1jb2RlIHNob3VsZCBiZSByZXR1cm5lZC4KCk5vIGFjdGl2ZSBkcml2ZXIgc3RhdGUg
bGlrZSBjdHgtPnByb2NfbWJ1c19jb2RlIHNob3VsZCBiZSBxdWVyaWVkLApzZXR0aW5nIGEg
Y29tcGF0aWJsZSBtYnVzIGNvZGUgb24gdGhlIHNpbmsgcGFkIHdoaWNoIGlzIHRoZSBzb3Vy
Y2UKZm9yIHRoZSAvZGV2L3ZpZGVvIyBjYXB0dXJlIG5vZGUgaXMgdXNlcnNwYWNlJ3MgcmVz
cG9uc2liaWxpdHkuCgpBbHNvIHNlZToKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC9sYXRlc3QvdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvdmlkaW9jLWVudW0tZm10Lmh0bWwK
IlJlZ2FyZGxlc3Mgb2YgdGhlIHZhbHVlIG9mIHRoZSBtYnVzX2NvZGUgZmllbGQsIHRoZSBl
bnVtZXJhdGVkIGltYWdlCiBmb3JtYXRzIHNoYWxsIG5vdCBkZXBlbmQgb24gdGhlIGFjdGl2
ZSBjb25maWd1cmF0aW9uIG9mIHRoZSB2aWRlbwogZGV2aWNlIG9yIGRldmljZSBwaXBlbGlu
ZS4iCgpOb3RlIGFzIGZvciB0aGUgc291cmNlLXBhZCBmZWVkaW5nIGludG8gdGhlIHNpbmst
cGFkIGxpbmluZyB1cCBmbXQgLwptYnVzLWNvZGUgd2lzZSwgdGhpcyBpcyBhbHNvIHVzZXJz
cGFjZSdzIHJlc3BvbnNpYmlsaXR5IGFuZCBzaG91bGQgYmUKY2hlY2tlZCBieSBjYWxsaW5n
IG1lZGlhX3BpcGVsaW5lX3N0YXJ0KCkgYXQgc3RyZWFtLW9uIHRpbWUuCgpTaWduZWQtb2Zm
LWJ5OiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBvc3MucXVhbGNvbW0uY29tPgot
LS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy1pc3Atb3BlLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3Mt
aXNwLW9wZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLWlz
cC1vcGUuYwppbmRleCAxZmViZTNlNzQxN2YuLjQ5NWQ0YjBiMTAxZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLWlzcC1vcGUuYworKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtaXNwLW9wZS5jCkBA
IC0xODAwLDcgKzE4MDAsNyBAQCBzdGF0aWMgaW50IG9wZV9lbnVtX2ZtdF92aWRfY2FwKHN0
cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LCBzdHJ1Y3QgdjRsMl9mbXRkZQogCXVuc2ln
bmVkIGludCBpLCBuID0gMDsKIAogCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG9wZV9v
dXRwdXRfZm10cyk7IGkrKykgewotCQlpZiAob3BlX291dHB1dF9mbXRzW2ldLm1idXNfY29k
ZSAhPSBjdHgtPnByb2NfbWJ1c19jb2RlKQorCQlpZiAoZi0+bWJ1c19jb2RlICYmIG9wZV9v
dXRwdXRfZm10c1tpXS5tYnVzX2NvZGUgIT0gZi0+bWJ1c19jb2RlKQogCQkJY29udGludWU7
CiAJCWlmIChuKysgPT0gZi0+aW5kZXgpIHsKIAkJCWYtPnBpeGVsZm9ybWF0ID0gb3BlX291
dHB1dF9mbXRzW2ldLmZvdXJjYzsKLS0gCjIuNTQuMAoK

--------------3AmKf01MW2hv0Vhzmru0T8mx--
