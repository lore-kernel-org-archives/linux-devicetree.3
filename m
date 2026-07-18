Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAABA38BF9C
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784382261; cv=pass; b=WgbCusgyzK2ejN62I1ExQuEsBeLZo9d6OdAH0zsVu1GrKdxRNfl2p3A1xr1I1G47iskLBbab9dmwtxKLzkXciUb/W2fwrQ9imzCV3JdlCazEEjfD7T7hDWbQVepW95ciVZ4GBjTuoMKvr5wtv5ta3tUCzdYsQEOddK3JII4hGGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784382261; c=relaxed/simple;
	bh=9xRtxepn00YVNq2Mt97AzAuEAMLg3wg36kab35YmvUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOLe++JYJ45kqoWFIegL+2r8S1PJ2csxIy6CUw8+eZCACV7XCfAfpNjAMwd2ajECGB15r4S0F+3L4ujlbFWPg2Q7B335e7Ow3z2OY7hvUuIDX72w8mzfvDIxqHDbT7cUSLGN/mN3xGJ3d/gMTfXQclOldOBUX8aoBVbbjlqrLV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKagtKLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAoeHPFM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKagtKLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAoeHPFM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IDD6fk538258
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PkfE5djuvYksxq/+quScdXtUNWrd6xtiFm0fZFAsyFE=; b=LKagtKLNDTXdFdIj
	GY4CFlGbtdy+wWbyUxQAVRrfmHVJPOB0CK8BiJvVMza1jKqygEO0XBFZw4YZURJ4
	ul7fPKDpPctLICHbdEKhBHwr5P/wWHMhyJLTmt+Wb4xAZVkmeuKAkKLsrtgm0d8P
	kddW8gdxowweP16hg3Gl1HZ5GCgu0vR2dZ/1mYmuqluDLfp4FdK+LgxWqtDwvIP8
	IpPhnVFDcpbFhVRRdaBdLOwpeu0aZvXhr+0Zig+bEfVjM+SRKpjw+xUxZ523OHIN
	XeRIg2uOmIoolt9QsGjofV8X/SiwjYTRv+PYFjHYJez7Bf7eYGPvDyAK8pwhv/5H
	bBrc9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rsq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:44:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so65583306d6.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 06:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784382258; cv=none;
        d=google.com; s=arc-20260327;
        b=VENG+DyBnR2otGU7DU6HwblMA8gyw9DPAY4X8MCnEHAmgTiK2WX52xRCd3xxNBXzco
         3M6s5oUy5PXPfdvp6Xr3009CJpxQyaoA44Fe6NLMoFPPqzEmwnVKA2CC4101nlJ0XE0j
         wHbe3otQvU6PCvRv2CmV+af9DjdpBeSss/a4olkoZ9K+vZ9wf3r0RJAPcQJI+xj+LIRK
         Mt77xxZfISNg/3C25iZxIyxP4ES2HQObIz1RUu/cuXt3ayf1ws++GWvMYqmHUFOs2Tml
         FxMnuJOolJ/VhSb6Sql5DB93C3FuPRaBGF5Gl/3nERHhYnUsKv6kORZFsIxd9VCkPZx6
         5svQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PkfE5djuvYksxq/+quScdXtUNWrd6xtiFm0fZFAsyFE=;
        fh=UPpJ67iSO31zWyqZ37w5+YPeCeM1tDBQZAAGw/Ammzo=;
        b=s6Rw1GzZvvq9blWcLWY1QxiQ85zkKkv59H8sA7Nnfj0XHxyjnUlfYfwiUIJufn4yED
         Mbuc0aJhlFoWbNsr+pTFJribFgkwBSpz7sZRwZxLV8WLV9IyPdPxbraQRCrPtiiuga/o
         U/XUlzo6+o5e7bCIwJMPmlkozFbHcLemNdWlFLjcNEKwy9/OiT2ARxWY5BB7nJA+zD9+
         P3mOa1Z5k5fogvL1waJBmC2CjQwXQQorftQaT0OapS/IE+NqS1FK4rPBdz2c3zUxX9ww
         sz+0bUsqv1TCiyxenzYErmicn+2KDukhfaw31Kxri0x6K0W0c2kRZq4rZ3V7IX5gRbuq
         p9qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784382258; x=1784987058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PkfE5djuvYksxq/+quScdXtUNWrd6xtiFm0fZFAsyFE=;
        b=KAoeHPFM5YfhLEO0Bjm1QnDggcKn1+BA6xfHgAVtGNkwwvOYI/AIa70g8JneqXkm/j
         pqHCJVf1noxeXnZCefw02cdMOnlz6YUnioaSD03zMSYA/QSXgYNABbp/xTPYky8zG2dc
         E93+c1oDi8Z6K6bPHUgvF57qGSbGD9Tl2Q14hjPQZKIsq6IEV7lgAg5SVONh/QlQihwb
         Uqa3FEfeLCPqjwPFmUEfRZtG5YgfjmrIADtYJMJBQ3WhohNwDUpkZQkjt7pXJMlaykRN
         qlcmwAdzsPvcD6LCmxxLNCm0lQHGRMibDddCW6zfkMQ+ko4v8xzw1Ra1SsWrSq2F/Doc
         TdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784382258; x=1784987058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkfE5djuvYksxq/+quScdXtUNWrd6xtiFm0fZFAsyFE=;
        b=he3bPncfTngfiLMn5iUKgtsrp5oOmjzm0BoKiLRC6Zr3LM0KwLBf8X07n+OhnBJKyt
         1o3mfFQ3EBi4OC6XUFPBpkQUymraOz28ILNgWQEDKl7iTFzvDgV/o+bVnBXkhu0byczt
         MhzTKw3dxxP5HZLlda5Wk7QLeN9k0q3hLTN2UGn/Utp8n6agXWyJMKQr2S0HDA8B8J3b
         ZSaWBV8RiqGGcx2nCyPWBfTxJBP/7yX4W304DcKx6wkPkPkqLpFc6oYXB8lwF0onWAOH
         NQDV/BYyQuWDJ649FpWvT7NA/VtdhQqdUM2daA9z8OJp0AWrlRU9rubivrn2tePG35su
         yyxg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8tKp3JmRypJ0njfdXhMC7TYg4IXGtfEsjTTWrdE4VvvG4ND78LhW40vEQhNUsh2HCCY9byXpTppC+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6IozxIQJ4W3x3BwKN/xauM+DkHqP3c64YYQS+8lnV0CPXA8Z8
	rORxg5sofHAMKgffW576cYzhxTn0QGALs0H+59fDPVayPSGp3UWrTRcr/NjstQbjd2kWPsNwYdE
	1gky6kgsTvgclMO3oU3yUPJcX2nE+fufejDNDGnBt3uSMo+WJGlqoornqrf2aSZWtCSP0cMtjNl
	S0rbh30evIot8SUrKram3KQZMu/7culuDlA1lS0QM=
X-Gm-Gg: AfdE7clj81GP4FojwCe0h6Wan98h8I7hSh/USRf3ArZOtL2mUkG7P9UxDuK5xFoau0o
	+05MFTTv8ajjVKvDWyJpKU4ipCIkn/BCUl1zScYFpT6SnvAJBZnKBDjtPH7dI1WKvqoz9QbZjin
	TA5ASwETSqrMx54blGTuiz0fUY/MfupSVwrzMoFedAGatZVp0y6okgGdqrjg==
X-Received: by 2002:a05:6214:519e:b0:8ef:91c5:8edb with SMTP id 6a1803df08f44-90778317727mr72671836d6.10.1784382257952;
        Sat, 18 Jul 2026 06:44:17 -0700 (PDT)
X-Received: by 2002:a05:6214:519e:b0:8ef:91c5:8edb with SMTP id
 6a1803df08f44-90778317727mr72671596d6.10.1784382257536; Sat, 18 Jul 2026
 06:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717180536.1757204-1-kamal.dasu@broadcom.com> <20260717180536.1757204-2-kamal.dasu@broadcom.com>
In-Reply-To: <20260717180536.1757204-2-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 15:44:06 +0200
X-Gm-Features: AUfX_mwFg-cDp9qgxVGyV_czYgM4oxliia1j4hpwU1KKYx93iGgZ_1rVtnZAaRg
Message-ID: <CAPx+jO_PtiodfrfLD00ZXWDpYS73ftbb_e4Y389JObHRw-cj-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: Document no-mmc-sleep property
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Avri Altman <avri.altman@sandisk.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        Erick Shepherd <erick.shepherd@ni.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE0MSBTYWx0ZWRfX9jWWYKbwVvPz
 yLdgB7vkdEldngbGO0e+gYQmqpVk7SN3MFgJCx2UxMFoSdOrkGOOM5a9a9nRdEkKz2OHO4nDxZ7
 0CmQgcBZy+reHo+TgqQM2FpEP+o3+zRc624gklv45eeNFQ/iCpHffVu+902spCY8J2z00c3k0NL
 Cc6E5TfZ4jk5L5zNOgl4K3L5AJgFc/PYUB1vyd7Jx6buc9tvgdF+xHCAQuAiZMJHYr0BA8Z5y7X
 YrOTTO9hRJoSYtz4c1jj0HPLTCNeduvSk6ATglzH9IP3Exl0RIEAsdMbw6AoCrNaWuLKVbpTcrF
 6laPmKhC0/eBo2a41KnYv3M0nbvnSP3k0S9sqI47+RQdKjRk6QHrBm3mwFbyzKbjQkM0/Ij1nhC
 y56gn0Gzd4XVoodKbryTnjeb6kEHqt4CWByihlzzIWUQ+XeUWDYqpV8OqA6phDrQ8/8r1LHAzU5
 wYsWI37s96ACZEhlONQ==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b8332 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q-fNiiVtAAAA:8 a=4FQgA8aB1pJx2ohrXaoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: PfN2CMzxNzZcdpUApz2pE4kJ08COK7bn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE0MSBTYWx0ZWRfXxQcKspYmrIsf
 CVJfsgixpHXQ/U4Id/+msmSsWqS+yzgQ1LjH4zTUedqDIxDQwMCqANnpd7MXKoKgvJz2W6YIyXX
 sffYus3GLTogN8RfOfhQGSerLI9A2qM=
X-Proofpoint-GUID: PfN2CMzxNzZcdpUApz2pE4kJ08COK7bn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180141

On Fri, Jul 17, 2026 at 8:06=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> Some (e)MMC devices cannot reliably resume from the SLEEP (CMD5)
> state within their advertised S_A_TIMEOUT, which can be problematic
> on systems that resume from Suspend-to-DRAM by first pulling boot
> code from eMMC using hard wired logic that is not field updatable.
> Add a no-mmc-sleep flag property so affected boards can tell the
> mmc core to never put the card to sleep.

Please clarify what the FW is doing in the commit message so we can
better understand what is needed. Along the lines of the below.

Moreover, as stated for the cover letter; this is rather about keeping
the card powered on during system suspend, because of the behaviour in
the FW.

Moreover, because of the behaviour in the FW, the kernel still needs
to re-initialize the card at system resume.

In regards to the card advertising a wrong S_A_TIMEOUT, that is a
completely separate issue. If you want to fix that, we can for sure
use a card quirk - although that quirk should only override the sleep
timeout value that we use in the kernel - and not prevent the sleep
command.

>
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
> Changes in v2:
>   - New patch. v1 used a card-level MMC_QUIRK_BROKEN_SLEEP quirk
>     instead of a DT property; this documents the DT property backing
>     the host capability added in patch 2, per Ulf's suggestion.
>   - Reworded the rationale in the commit message and the binding
>     description per Florian's review.
>
>  .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.=
yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> index 3d7195e9461c..11df0524530c 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -232,6 +232,14 @@ properties:
>      description:
>        All eMMC HS400 modes are not supported.
>
> +  no-mmc-sleep:

This is a misleading name, please try to find a better one.

The property should say "because of FW, we need to keep power in
suspend but re-initialize it at resume".

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The attached (e)MMC card cannot reliably resume from the SLEEP
> +      (CMD5) state within its advertised S_A_TIMEOUT, so the
> +      controller must not put it to sleep during suspend or power
> +      off.
> +

Please rephrase this, along the lines of what I suggested above.

>    dsr:
>      description:
>        Value the card Driver Stage Register (DSR) should be programmed
> --
> 2.34.1
>

Kind regards
Uffe
