Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17400468C12
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850995; cv=pass; b=tWf4sq8mN3Z8Ud5EP9n8pPI9bODfbGpx9dK7z2ZG+T5fvG8nRo7BEUwajQ0fcPoOEg63X5HA/UtEcvPMGrOkr2XP9yI25ZwgxTgKJ6wolCQB69gzntTIhW8omaovRJCs250Ly9o1TlZk5UDpejzMhjMZmcl05TlXFYX4E/n5I7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850995; c=relaxed/simple;
	bh=I5MvKEGC00NQ4Q/IruORDwBeXJG/s5q7GewPycS9nAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFITFmVPUM6C3/BiumHfdaAl+fFKBX3KNOH7byZXOV54N2graWMTUVV95w7UhkbpLAworRNettMMWM8X5Ce6ai91z4IO+4FzBLwy0a2MRXQ0+zrJN5cjqrOfFuU+KcJqUpVtZECOcQjuBaejZ0votVe/ZnZmlSYmT/OYKeSj8ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dI4ZLN5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AuFqajpc; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dI4ZLN5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AuFqajpc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CX4pL3572378
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 13:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=; b=dI4ZLN5nAyQ+W8fx
	j0sKvwTO2exEedRbGmGiQorxFmf9S/+d8HSikRwTkd3wOaVj9WRZgT5tEzitjwtD
	83YQcgdGo7wx4vWkYPBGAfE0iLSBjEQBsF5CKaN9yiLse7GFLkHAhbgElT3Q3sbc
	NfRkqQK0c2Dkja+78VIfN79qqjTwECAxdjfz/4FuRiSklY3LyJZbP102yMMXMoxr
	nz0nS1gcohVdrosVtWamhgNn2bXd9gSNRaFsg78BQY0kQaqvAij8HgIpTwGG3BgS
	vIYYdOXo+OjAqtJMZQmRJE4Xxf/kX8RK9ivN/qzyQ4ZA/apONyhF5dvJbPmWp+dM
	zdcWiQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu2sykg83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:43:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso12623986d6.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850992; cv=none;
        d=google.com; s=arc-20260327;
        b=GDNiL9M8B/uBk0CNjCUvR9PfH1pH6KfVgMiK3enzfFgiclhxKX8GTfeZojDoc3Ibgy
         EH/r8KkLnBqDzERBcPju2cF/wYnlMr/xZGkBtL8Jj2SkTNdYI5aXkZ3zyC08X/wuKAGd
         sw8o6Q/qQJyGPa54gNiMNLbl7NaRm1R9hvC3Jxy9rozAZC5m5DywYWBRJFrNSnrdbl4G
         O/oJvbQ5BMHd8fHmhNHqqPxC4V7Z/r9h7SBfqY6F3U5CZNE/Yze03Dx/lyKKYFp7bT9c
         gPxgWaMh7kTlIZ/2FHRkYP7mBkHKbOK78tatyzsrL03Uhtjh8pONK3choC9oHMeEWzsd
         UchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        fh=b5BfCrGy+mmbqhDZr5DZn8x58ac+lY/5aX2IsnLOz0c=;
        b=eZ0ne+NQ9ipqlL36/MhJP38pdCnMLKyh2m9SaMhHEKI8axeiBPCYTqkyGZGU6SfHG8
         bmzi7/WuFp1+ehLsA6J0aVXyHEdSUT3nJpN6oGj6/WuNPPN0FcjVi8fmo9YEIgFC/M2d
         s/vpumLkBO55VE44PsiPsukJvJ1yAY61ixjlYQDI/DpOXQXyVyA2JUkQkYfRLna467kT
         cyK3Uti/fwo63HfrvfwTxtmpxQEkss065k1mA8KKTbVzErA23XyX7H/37sQPGaDdtxvY
         ALIEHb+KpuHizYZ8GbeDintB7gbin2CUaH1YdmYh0dfMNGqbvA08kpwZqaDC+0BadkXe
         88Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850992; x=1786455792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        b=AuFqajpcc55zbr0Nvg4OUAnAi6hNSYAFmALbjtLy1bTRsPo9kJOLxUojyD3iIlw9tt
         ZSYM4voUvavORr6lFAgmbBvH3c7g5ubuOpsU1mkNmN2Wo4Q5AAJ+ooM1V+q1t+hzBIs3
         GYvpm0LShmDQCGSA7/jxkSE3z64x6cMNgoZQyFW8Bk7+/QKG9fmtn4u7M4bQ/brRAyNt
         tIYyN5tydIQjaGsfDp8qWjxCrQoD9vGkaJ1AZgJW8veeqkFjDYNpS4dvn94ucqnDn3QU
         JmP0qBnVfiXyCrCsjmjWdOFHtWDGCfaremxZ0iYMpvbFx5smcaOCmTx+aLVf0YdrVb6S
         kIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850992; x=1786455792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        b=bWi7naj6HteRdd3nAxHp/GKlIKlg2uko4fKOMbHDRV5PFlnrfZuwXP7o5vMjKqqw6K
         pX/z8ZRD7QWaxSiNvOuWNioN5Mu8mnUHnQqnbfOAQm3UBhPRdrIgeZfYG0daTK8LWCD3
         wygQ03fgulRXsYLQ1kAfp7Wep2WSSJwBt7jtNpOMIUFzE1Aa7AQ9/wFh2BxntmEXxp4w
         9uPCyrhxUbgjRZQ6ombBqWlUwY1QfLnxTj6Jx2JftEZcBWYj2gp+Ya6cQLsUBweWAMw6
         bCz1EfDVjFbVzTqwODIh6hBCisnS5bKQKZ9hG2WwqhvEWP6KSceQWPnpVROGHHRR8KKh
         uo3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr6ImyVxknhjDM4i5KUFbpRxRqmYyc3ftZgZ0e6xmg0s0OaW5d9hIHiwXkJUYv8ojZFbpPGegrO5HRL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8RBWj1rrC2ROC/1f3cXtLT21L84r5pB2/Z95UmVeHDOyP5s/V
	Eye7SD8rZDMGkQWTztvHIpNbK/riv6I18IjTM5Y2MY9TBGkF4sgop/L2fmEkmvMeycIiMEDKXoh
	TRRASVfbtEcD118yArIrC3XHt0bi8jL02DrzDI2fyyQX2n96BuW/HAK3eisB01820n5owDmRWYV
	f7tlJOjW8kTGP6BFUVXaGb3ZWYqJoruoPm8imILu8=
X-Gm-Gg: AR+sD12iCH8dj1bPa1vK9cV4PBVqRcLvdMKKaTbR7abOoEdcPYiJXYDSU736pPMDFe9
	g9l06KcfTHmwidA/qM0bv23ZSt6k2gH6y9uqNttLlvS9GtsleC0WK1eS60qs7wmJ3+bAMNoRuCz
	CwgMEwZ/IdEN2BWV7P6peuwC/CF9i1ft1vXodj6gOHF/5/QcQsogoLL8eBtQ==
X-Received: by 2002:a05:6214:5981:b0:908:4249:337f with SMTP id 6a1803df08f44-90872b6c49fmr82414496d6.5.1785850992368;
        Tue, 04 Aug 2026 06:43:12 -0700 (PDT)
X-Received: by 2002:a05:6214:5981:b0:908:4249:337f with SMTP id
 6a1803df08f44-90872b6c49fmr82413736d6.5.1785850991910; Tue, 04 Aug 2026
 06:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
In-Reply-To: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:43:00 +0200
X-Gm-Features: AUfX_mxFXZDTZA_oVlCI23bLtNdk-8qS8d3T_pRa8l2TAPJMQc0QtFw5SglOqh0
Message-ID: <CAPx+jO_Me2qHx8UQF7059Q-W6cyOtnw7ov-CnMhYo5d+9aPKRg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: sunxi: add compatible string for
 Allwinner A733 MMC0/1/2
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TIh1jVla c=1 sm=1 tr=0 ts=6a71ec71 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=IpJZQVW2AAAA:8 a=f_oPU6YZfnA6fFRCD1IA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX68HCV8n+TVO/
 RBPWcGHlGSbjzfyoA09Z9Onn9KxwHIZQwiFKyIl3gn3qqYCCx3w7pwM3FrOTBvbz1ek3ic2qD6s
 b9EAfWmnG3i0U/I/xaH3JVfic/rlgEQ=
X-Proofpoint-ORIG-GUID: FnD27Q89TSoxgQ_ZrNRp6Lm3lpRv1dpg
X-Proofpoint-GUID: FnD27Q89TSoxgQ_ZrNRp6Lm3lpRv1dpg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX1Akh32NuDM9M
 q1PHK1/V6qj3hvvN1snmda7YZxx+iLmLMyZTbBj+S9iom1oKjUBvop9j6hpGT/yFBHdfazzbptq
 PSKnc9b8XY3tBFbf3MxlehMbOzkizdfwpOvXOeYzipXb8xlTI4F6xiHebl9Go4xPqzyF3QEEpVw
 xJNYdqul1Zr8Au5Jh97dpN01h6ktEFfTK/XtMhEuZWCzRJPeYRkP+R4cb5CrOpzm4uQDaJrA8NI
 al7OqUAzTfcYZFYwBsBCvp3cOcC3vkYED2OAF7KlX4YxUyDH1FNReke8UQCjk8grFbS6xjruZdr
 utYCCBBK+F0hCvb44kt2n/yG1OWe861M9ydScsaB+FJair+pTF9POFP/pfbhodag6O31JhPFh8Y
 o6AKOBRt9koG2C0yoKgA6czqzBPpgu+LFzF02p78HP0hQFU5MM6AzU/kNuXnEYq/HqU0vT4U7GV
 +Eb3cDH0lqtVfW8H0zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040110

On Fri, Jul 31, 2026 at 6:22=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The A733 MMC0/1/2 controllers are compatible with the D1 ones.
> Add an A733-specific compatible string, with the D1 as fallback.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Like the A523, the A733 3 first MMC controllers share the same IP block.
> The 4th is known to be incompatible with 3 first.
>
> Unlike the A523, the A733 4th controller is not dedicated to eMMC.
> This 4th controller access the memory through a different bus. This is no=
t
> supported (or tested) yet. It will require a different compatible when th=
e
> time comes.
> ---
>  Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 4 +=
++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mm=
c.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 9f3b1edacaa0..9e9610bb1eda 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -56,7 +56,9 @@ properties:
>            - const: allwinner,sun50i-h616-mmc
>            - const: allwinner,sun50i-a100-mmc
>        - items:
> -          - const: allwinner,sun55i-a523-mmc
> +          - enum:
> +              - allwinner,sun55i-a523-mmc
> +              - allwinner,sun60i-a733-mmc
>            - const: allwinner,sun20i-d1-mmc
>
>    reg:
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260731-allwinner-a733-mmc-support-c901bc312eef
>
> Best regards,
> --
> Jerome
>
