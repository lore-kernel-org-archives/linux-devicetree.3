Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008249;
	b=Nh5mhqBsSRmRUI9jBysKOAJLfWKtXDzom4IgxGfq7A/dD1tNYZNZm2YBCjms+axsQe8K
	 bewfx9grDgLX8App1M9lkW3yesSjeclZUDuZ64yE+P4vtTrMR7xiRaKaNESNVW2RVFPLy
	 h8LL9ruVVygK647DW0ftJnPPEya8CaGI9CTPGCaKaf3hIYjV4fbdQ3Yw2VSmgqRcwPmHo
	 XfmskQ6DZYwQdXhcdc9I1tRSO221v6H0EwJejn/hhkfMjx6dPccI2ncjURCmBmhTC8pDd
	 I3E8SzPY+aGq5jONsrLlNX5F/rcMaxlhLwyr+zDUt2K42/dpJq39guH3InJ64WL8mjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
	b=ymwhu7COnQIpgfM0H9tL7oiD9A4yTBAll5Co7LoB7MKNA+ekJ1aEjm+2QzjWakxYFP/1
	 61m9O5BE9GTLiujAebHHlE71vUDotPc3sQRFq0A6T78VIOkgKYaPMBygl3lOayJ4Ts8j8
	 nZ1PqiSxyK448FipAEP2Ukw2U6fShOh2RKfec8DUvH+25VGdgtScjLXECWzNHexigsVO0
	 T8wM7dr22TPTE+D58tzv/XEz+RgOkW9fdNbac7SHrq61UGrTUldwSS0EubcWJEc2WHjTs
	 Txw/WcvDC2foIahQfzSRiQA8XzCrJ2II4QQnu6SCZZVeVacoiaZUpqFGxpBpIkQr4yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZzhkrMU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYHdcNSr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE0F60A260C
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE0F60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZzhkrMU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYHdcNSr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aquu1181748
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OM9NA6+9DRMy/5K7XlTQer+g
	WEHVhhYXBGhL8vr8CDI=; b=VZzhkrMUsOLBiooW/QzsjtbJY/FF/BNqFiImpKD0
	fwr2m7fM28MoQIFGdoW7sL2Su8o950QtBmXq1vWRdkcX4sHhDtTRmHy54mMjWleq
	Ga5ShmvhNjivtWu39ZtJUqs+35VJNw5eoluHLVk7LpbHl+4aXeCMNRpzCEThq326
	otYkUxiE0FDo0zFRpGgmpkpZ/OTNrqHDUf801l8feaREka4P1vzSu5Q5Beh6J1xO
	xCph4yUZNhR4byoIUho1Zlj0jcD2PL7KSISsnB5WvS9TPIYQ5bryWSm8RxwuxAGO
	xwgfF7e4X0C8vtOH29M75scnnO5b6n6TLRWGzEw2rqqPsw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27wsqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99081ea787eso2727469241.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793008242; cv=none;
        d=google.com; s=arc-20260327;
        b=ZwOYQC3rc+8KY3TBhmsqBlVIXIoHmTadl2V7n2zv7pFloWUrL3zNdxMYUdTxUfn/5j
         LrVSxitQH7LlTL8le3IKcfumuAo7elqJIesFwvXuIea/k4149J7d0mAT5jUzyji0au6s
         ZYjdXm0++6xSR7d9fnAi6Z6DorLUkOO5DaaMA5pqsiKp6DTsE4nIFVy4//lRRtv36sOm
         6icL68u8BnWucG4W66+dbKHxrIwpIUMHngq0OW59+dlE5L6JoBRWEqAKruPXntcQvKs5
         3As+eO0Ihe2NXBjxuG1z8GTQAGWCPsuz9PZyFpnIisJkpCuzgqcXYIjSfg4L3gWHOn+1
         X+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        fh=Kx/Sg76t2gOc/CjeG6V4njNx7feWY0Z010nAOMLERgw=;
        b=BnkXbhGZNM1OiZ1Rgn3MlDPZOYxy4nYgvhw3KTGtBA9D2t1TuUPqdf3aqVXFWM+KyO
         m5VjdrEXk9ZNNSmon7hdBanMcyW6KV1UafDrENY+vBM9OcdqSNWse4kH41nW84qCUxlq
         khgRUYGQpZpfVkrls3x7Mzj4XPa2LjkbSHob4WcINZZ6QwJqG2uOzMBttg+NL/0pqKb6
         EqiK60rMEopnhEErzSB/vp99uO29RWZXrNq7W5zPtAb+fYGbaj1wsRXzFZHMkj6OhQFe
         xTYARbgHW76OrCKwj47IBH3snquJrjB+Jm/6XNg6bFYbPPLLoPLnFc0e107YZlbT5Glm
         DYVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008242; x=1793613042; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        b=GYHdcNSr34P5rNbw4vS+cM9nkUtxtGfSIjaRf1D3cG2WvGgCDE5FrNLau3B40MPNc8
         WVNZoSgibs8GMgNdYD/8nlZvfhzGLjD/Dyxy9CVakNbxiD+UtHJLhOe8Xnb5k96E6adS
         SGknZJXr5a8F1KnrmdQ3FjqNzB3GmuohUBIgVe7VIC2Dfx05udguKArKg944XX1UQcgb
         UJfnIvQ9wjCjZGY9jH5i3VddB6n9rWbKhMRFrTHGR/NYTadc7pNT0G8+vN5Ma6nLTHgW
         shBR5a7YTXyEBr2GSqW1o3yFqAXwqbVRguG2IcbTiwFJpueD7N+co5JcxVd2EseJ5kMR
         2IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008242; x=1793613042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        b=MlGj1r2UArXxIKRxHWF2LIO2jSyIXHosZRN1OY3yAce9P5HW4nr7GmiREtEmuemff5
         xLzgzkb2v+U2RQyxUFLIyxBVhrObRe76l9/w1hjGba0/PL1668WSwWuc6ENzA4MJndUg
         85xUZ/MGTaMvIfxS2AfEpkh0UDHI8MmeDjEic4//HLRDgMMwQsVI9VitQETheSSd3QLq
         5A4JTuTqRiQmkfMPsw9yq81rieVBKLI582n1iRKSMrGCOkMNL12cm12Q7HolPHfkEIk5
         u5crZNPDmtyfXCMf5huhNWNBKFP+oQv4t2y+6eaQqoEW1BDILtGryjMePbi6KQcXY7rS
         vnpA==
X-Forwarded-Encrypted: i=1; AKwUvBxUjoBbY6LWCCh1+8Nt3sJBhY1op1OctAU7K1uBWw9RMNuZ4lRf//mUhcm/6Tq4piXC6FzNN+0Vb+j2@vger.kernel.org
X-Gm-Message-State: AFq9FYLgBkvzxXkvNgHm91BDD2yPOA2DICq3m8kCbN3azP5pkBb2wzum
	pJ0tTh0GW5kCQjwSNn5whc/ZhiKdyovnWqSBryLlouOlFOj7kaRUlR83QSgCFg/+2Mh9IpTzKKN
	7BOLrflSipIL1NCuYhZrISkdkxW8ZNrCBm86Ixqha74Gc7yllpWkTXFmuipoIjDB4mnbsEx3iUo
	D0NMvRwPQ5qyUmAEH143h25juTA+7j/EucmArwP+k=
X-Gm-Gg: AYBFou2suhuqMDVbzQKTZ4uUnPegHzTessYfyI3uwv1pz+t2prva9RpcKvkZQAqxsNg
	kbLEeb+sjNCVzuzbqzqVDy4NabPYEgvL2Fb3IyBeql365cu/oagVFY2h7ru81818Gc4imM3CRcm
	h/Ad0NuLljBipHziViDAEkDxq5cnkU5xPXpblTMYCyVas0bHJ2iZC7FKm4J79zj3IRwuBjOsNSD
	HyI0SgLxkNzoIQHmA==
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ce5cc37a74mr1922782137.8.1793008242562;
        Mon, 26 Oct 2026 02:50:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7ce5cc37a74mr1922772137.8.1793008242146; Mon, 26 Oct 2026
 02:50:42 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <DiH264mdSk9atz9YjnNUImra2MISyqRZQN8lEO6HpzVBiYU4i_cNONZzyW0DfvCXJ5aGIrBbDYFXRbTBYLyjBg==@protonmail.internalid>
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com> <5e1cc716-22d2-4d1e-b68c-0c1608890043@kernel.org>
In-Reply-To: <5e1cc716-22d2-4d1e-b68c-0c1608890043@kernel.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:50:30 +0800
X-Gm-Features: AclHuK9VMGCfWrLZ5or5WCH1QYYnG4gicCOANcYBpkmCFj6xw3eUiA1tUH_i_Q4
Message-ID: <CACbMrhqvfhyejKqsbCXRs8p9Kizeh8pS6qBygKDwpghPqrGzeQ@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
To: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf2273 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=XVB2PD5oAi8qZ-TPs3wA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: EZRj2wo1TVAiPBHAeh4KJojw7k4I4OUb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX2Jz5QcVk29oj
 rTwilG1Dvqvk+G0bLgsPwwnD4P4CRRth8WD0+q2e4dQGcZKsUm3sbyojB2NC+PURsXvcudz2ZFY
 CxxgPSFYKVhdqGuqtlzrNJZ0qS75Usg=
X-Proofpoint-GUID: EZRj2wo1TVAiPBHAeh4KJojw7k4I4OUb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXwhVIXkS6ry2i
 XtRcyrz6PVdMTbbaJCQKL0ImGIwRMSBHRg8hyeOH0BPXBiYIzHDbUO7sRYqiuUAwPCvC2DEhlAs
 ddMppWJFrlj3+CMBrxIEriEbsnniWoEJG/5CtO+b4AxB0Z1CSgLUP/NZMg0ZaLA7SbkIcWeICF4
 Xqmm+HKlHnOyjjvM2CbRchf4JNjxWVXQE9fCHyo3c2BjZ+2evXwOXTzI47zr1oKVIV2KNzyuoC/
 XwXVtoKpFJP2k+OFD5QD6H2DOqtZ15/TDEQ/7+6QlBJ3IGkWqLsfl2SbUL1kHkaLooSgrZ0+9mG
 j/HHz1O4yb7gnp/C8GfL/NES7pr48pTs5blyKnrtL+CwNpWq2NnlDcKNMJMe1aRyKS2l1tGElwH
 PIA8hhbxVftgUFZ3rS5VYbmksCgyAHXn8NJxjNMdbAZIvj300LNIOaEsG08MbuHXnc+IPt5mVQl
 62hYzj0vndChP72f2qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On 10/25/2026 7:15 PM, Bryan O'Donoghue wrote:
> On 25/10/2026 03:17, Hangxiang Ma wrote:
>> +#define        INFO_INPUT_SOF                BIT(12)
>> +#define        INFO_INPUT_EOF                BIT(9)
>
> Excellent thank you I forgot to ask for INPUT_EOF too, which we
> obviously need too.
>
> ---
> bod

Thanks!

BTW, I'm not sure whether the current addr_update design fully meets
your and Loic's requirements. Since we're still in the merge window, an
early review would be greatly appreciated, especially if you have any
concerns about the design.


---
Best Regards,
Hangxiang
