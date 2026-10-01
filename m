Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3D2472520
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856883; cv=pass; b=eMhycQZIFyir1VDWvpdzL+aVUpnzl5WQRZqxzBQgtYzitOd2mhHQwKDPe9ABpL2MmMRUN2ZCBDuGJVTzWwJCHORjxkLAh/5dij26pjWDAviRDIzawBAM8htPg4u9yXrlSRQlYpiOTZKmf+u7546yWDgn7xaLtnpEvAHplkHrhQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856883; c=relaxed/simple;
	bh=GQ+mO9FqZTwGcpM6upiyjFp46GJQt7lNaQI6Ua8Mn+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkYN1xli8uXunOjL+dBglXkPlR/n2BpTgHD0CHsGhgWuhGFQqIPJp7AS7PZSDy/TLWac9vzbqtNPGSA9aCAQIc6BjON3tkmtVL+jSXMChnMfm7nqb9NdMl3XYaZo3daZT2AvTEFgI54nnGVjACi0i5av3zeYpxrRYd0LxXndzf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix+QKi5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlQHtxDK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix+QKi5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlQHtxDK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691AkEcZ3388179
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=; b=Ix+QKi5qPV1KtdYU
	Fd25b3ki3mnYwBCEfyyo8hdnic98d5QIh6iuvE6YaWGQ5wyjxfrRUAtvFXTy19dR
	rciV7KX7QI24gLaKN1mcP2EKic2w47fzakCeYc7x9r0OAjhiu0zuewMAp7rCOJfm
	PK2uj6B38BTmvItLU4ryTowSYZxZ0iaaMokEpxDNVywufMAGE0aXRWrUIBx0j3lU
	J9fs4CYlvJYIlrwm0y9UTz5vf0uvZPnMnYQxXS2pdmx2tFzw9WfuKT6wK+c5e+7O
	azYNBplUrf1peMWraTpwUdfDTrMB2j0fkv2CM4MsUiAdPa6hXZ6gU2IlgUXy0bMJ
	etfVfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b8avt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:14:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso209506385a.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790856879; cv=none;
        d=google.com; s=arc-20260327;
        b=a9AsuZ9dqKRj7BwxGqpLKrdeCELtuThPnHzw3coasIiCIIYiE/v39GhaIVqbDBndqo
         a7D0xsNqiAMAcf8hicyJgxWAgr2FXOVIS0HAYnYJxyZvGmtjGMaQklQGJQSr7ozwwiLe
         sHc/9FcgYEQJjAmgtWXc6BKZsQZkL1WLEHRStFzmwXt848c3YqjfbQlIa5PDFiAdhs6c
         qyrA4cruIGm1T78v9vrCbaEr7HFTwmyi5+0+Fp2begmSX8wEZChT4NSG7C4f/kF2mbqv
         yVI3Nn3PuW9Kcw2dqVthIXExepmsHXGYTOrLpxH5RoiQVPv7PBkBDR6kvLNkEQZJ96B6
         6edQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        fh=HyjLaLGerxD9Tv2XFDBG+4HsWqbHpWPHYW22Z/JK4OE=;
        b=Hamg9ktjfZzf5Wtktbm1DC0occjAgR7XXqUDjNpKwebYoOR9Q8f9yK1+udA2OXOLXA
         RFhZzayBDtfF5fUQsoQEjI//a00TNlfUIxxg4qKKMGi4K6xOs4jMbT0BdPLABOn6nthV
         6Tsl0op2mUWNfOvmUvfbG4YFv6ytOQpKXbxwRvlk5mg+18TarsTZVgm8BYXY8vHuxzlS
         5OlZVSZq/kQP96fe32TDZKUp6M69dXqbW7ao4oEzpeVVh/pDcdZYTZ3vQ6fsHH9DWQPC
         KmyCoTcQ7LlvbdYJ/Ea4CX61hBrq/IALjXXJjwBx1VrNagBdN2LSV6mofnyAS9Fuz9Bd
         9FTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790856879; x=1791461679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        b=OlQHtxDKcClYMz+IKTZhtkY7f8CV8ZlvY9r+Ok0FRDFFGbVuW0QWmGmtg1x2CU7Zo6
         18Hv0CLA9GNZCfrLrJMFU3nxJy5B9Ev40h91vKTd7sujWw6/nIm3+KA5NV/nBmKGfdXR
         V503fqYemLQ/zRq5WSRTvRoW2jvSjPBdsIz0NfOUNA9R/P6EkOXCHv7u5uE2JhwECJjC
         DOm28ZeCtglbk+g0ZTLj6N3N5y2O+iIUSvoHUxcffREO1Swbrt4q7UyK9H/rnrg12B81
         bhN6HKfHAxSrlKfM79qDbHayUh5/bSCtAd1Z09V0PkL0JKmOz+BzWLvKBQEs8oKzN87l
         xoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790856879; x=1791461679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        b=ps5AIdWpVMW4X/FtlPyDF5Okd8LdvvVg48L5MzVW6ijlfCiKqYjNaZqpG617fyKeGS
         i+meU+Jpfx/GJksEMlQSEsnOJQVK4tyKboVTSvQ+v8l7BvEryy5EDlbUOE3aAk+5X9qw
         hn2cDPwx7uBdf5rj+y8l8NvZXDQ16ti8FT22gONl8BL1mQ0L41O2Oi+EbMlXiUNjVj4F
         Zm55tWUGMyiOBStc8fGwXHTWrdNwmtj/tOCXg9aqBAyizJTRrKYVJSTnB3KtgzDHC/A7
         yl7LUNWjlDVsV9AkAarC9AEr0Zw8sLKM7t2yCZHTzOJBbbcWcpFHSy1IpTjCmKhektQm
         ufGw==
X-Forwarded-Encrypted: i=1; AKwUvBw5Dhq8E00r0EoqXM8Rx0gyJ7Z4xrSTTVE7vFs+NsuNFEuBxb74s9Lj+/cRZexh0u6YDto0cmHg1EKN@vger.kernel.org
X-Gm-Message-State: AFuF++lqFrz7JbC89p2RsgfvwBM+9m7Sc0w12I/atJk+ehFhi1ClR+ay
	UgXRY9hsnPU8WZGKHnOzV5O/p4cB+tPWk1EuQL2trEo6AOk53je/mrtlx025guyT20ozjW9/fTa
	SLN1QXAbv8MJqTk9NM8mgPmDPzZ9FnNunfrM5IfNfaktr/UP0MiHCQICLFYSeibdB20sl/JL54L
	W55HOz4HPj3I7Oc84HPJB5t0amOdQQ4paWSb3mt9U=
X-Gm-Gg: AYBFou02N3CnV0cb0PrtcX5bH6K60H0PwqS4G9KUgMS2uCP1SdWyNrk46I5IYiOogpP
	bpkd2CZndXBVX34663DOgvEG/fcN9ZGrcOEkkVNIugFlKQ7heYOa282sDeFOqTUOufltB+E1owC
	ER5Qdoq9OkKOO8SZP0Cbbu/F2HsdJMmcgiTKiqMQadYea39irgtfDT9VVIwHv9zQC7WNCfjrl2n
	UhU4RzqbYiVq1kehhUwKWRC8EwnPTV5tsUNYgaduOcj01qRY7iWUnLlQXWBtlwhnpeMmMYw1FBg
	pXWcMjk+NSDUpGT7E/kxctfKdh29
X-Received: by 2002:a05:620a:40d2:b0:93c:bb1b:b6b7 with SMTP id af79cd13be357-93cbb1bbbaamr275240185a.12.1790856878438;
        Thu, 01 Oct 2026 05:14:38 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93c:bb1b:b6b7 with SMTP id
 af79cd13be357-93cbb1bbbaamr275234585a.12.1790856877804; Thu, 01 Oct 2026
 05:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com> <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:14:26 +0200
X-Gm-Features: AclHuK_XuSX4ZePWnnpee2tgGkBBnS3UvugT_wZeMdgt7PGi5qaYm1CjHnboJlg
Message-ID: <CAFEp6-1Zvt0hhBd7LNx2hsyi9J+bxCT8EWN3jZ4B30SO58SCow@mail.gmail.com>
Subject: Re: [PATCH RFC 01/15] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: dQa2ve_G8KFprvvXK7itYn4UVVMNX0ap
X-Proofpoint-ORIG-GUID: dQa2ve_G8KFprvvXK7itYn4UVVMNX0ap
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe4eaf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=R4gLiKe44IeHqeJXRIIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0OCBTYWx0ZWRfXy/iQW2xAYzy+
 dQiU2N0UW2o/dbU+j6/uOgjafo6vaAMb+iG2X9+rt+nbbGj9tq9hJ353WttvRSS/TGCbe5bIX+J
 g2+dwr7yYNxulbW9PBv3y87RRNG+I0w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0OCBTYWx0ZWRfX/mr4puQidZMy
 LUeIyZtFjFOJs0JtVKk4hlWVbN4xSbMfH5zPMvyiLVh9o1hZnWKSyVkqx39jHy4zyUqDYx7NvpE
 IP+YuHflSwpJX+EvSKtPklY3UfpJaiF+9yUvBOlzMe3KjjAaq9b9obb3/zVMudzoYWJ7egAqKv+
 mV3ek4nDyQNWE2QHzgU3Djl0d39kvn9S3DXAoDe7lhffc99FtFXrhpiH6f2BEaOo2P2bg4a/MZ4
 T8zRbGNbIKVMmq9MPcOMkvaWRHd3t3l0QaWBo/pYstKaPc/fy9FGQkt30o2b7KWOiMte5Mg6HTT
 OI5h/gucN9bwYhJnjZ6CSl04CjliG4nSW3MeK9rQ+YBHyMCvicdARNM74IuBNM5W8cViMIJzDpZ
 pQCx7d9AosPRAmz7CZD6cRdV7GteGHFNLZYhVno/81z1dZkbBGmooLjQcU3LP33XYwcHgQ5PVpx
 f1OuZKzQOLA6bXg2oFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010048

On Wed, Sep 23, 2026 at 1:02=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c8=
73bace1764fb3e3 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci
> @@ -137,6 +138,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>

I think we should stop falling back to msm8996. These are newer IP
revisions with additional features and resources, such as different
FIFO and queue sizes. I also plan to submit packed-write support soon,
which will rely on those capabilities. It would be better to add a
dedicated variant entry rather than reuse the msm8996 definition.

Regards,
Loic
