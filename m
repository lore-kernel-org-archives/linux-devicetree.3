Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368847;
	b=I3Fvn6+24dwlSBNHDkNlneqZRCpnNc+xM2lHmwqvLxyOlrEBR6J8PYUN7oVFhuXZWyDw
	 BX1txY4ySx/6TPcMorLGVQ6dwpBL5gpgZ7/IJL3jMTbrH7foPt6ZSppvHqlSIg1vqrlA2
	 xWIGzFtedoefiE1pGiVt5uKZfATa74eD6opRdRrc5eBaHQde4+UZNznpqz/qXgfyhKOUo
	 Id92wnWJvTS8lPGPSPhGhWcWqMV4AFbGpHEoQfqH5Ln7OoQGXWYYjztahqsJYRunDG8mk
	 ozRr+XU5yWO2WkJggsUnIEnRLvr97iUriseIR791GLnpw/iXrhEzVVn2SJSkXCh+81Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
	b=L7CKPyULwN7K4EjbyNOPb3eGccgLqvfSybp6oBZ47fdDNb4FQqx1ucR9sMbf5SpkiuE8
	 cN8kti1g84yL0X808dtFvdgzPYYch/AHbQBGPA3Tfvd6chgBUvwJlCmTVKpCked0e4THP
	 YbU6fxW47yBxxchbew7Q+fHIWOb9snPna1xVWYN4/zHJbBOebwXLFGCOBb5Pzavg2lRwl
	 xX0ScSPKqKEkYY5orMHx2e/NoHCCefk1g6qX3QlKHFAbuarKTEernOCf/hIYNZuxS5BP8
	 xGGSP/NXRSbw/i/Tc0bdKQtBBhlkWOGythh7a644zS5u4PBEvcBf2wXdBlq2/YK7Q8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yp5wOBuY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KdF0T0Iq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB74F606A32D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB74F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yp5wOBuY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KdF0T0Iq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnWRP3431733
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=; b=Yp5wOBuYUvaZ9G8H
	Y1Ge9H+4Uez+7kLRVDPNkz4UIdvmsydhiWxon7uANhBzMmnRD4gl4ktaeTi7mg1s
	e0O0BgJCK0RC5wjWI0qIafUgGDuhxHpYBQDi5Wq+ocDWDCGq6cVCNarTRp9nmrhL
	w/1K3hutLf4UKu83ZkdzgXoKWv1CPqy0/LBn2Dpm7ff5xpkl19H13Fn8+HXVwJQJ
	jonaNFWMxz/1aG0P98FMwkS8WWWzGZF5MkDntYotkgojATsIDlO08MftH9z5v6Ce
	l+D8tzVXSZfHpPU4HJ1K/LUz7NvfuyaefcFPpGSPbPHr6vXgV43GG/GFuf6ct9bZ
	GpjimA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkd5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:00:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e869e00005so13123725ad.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368844; cv=none;
        d=google.com; s=arc-20260327;
        b=gOaUB7UyDr+De9GQ6+FdpgvMHAr0fgdNUQv1BCKH4wn8Z1ZdG9sUIT3IqRG3EGdGMI
         FofgZWz3DyX219ao7XRIJrxug3ob2hTeqth7+y94pD3ajUDys4R04vYqDvqqCrjLjCU4
         pLEoRm6GPv/jN5H23KBxwRTrC+2UXdIGy66QbLAilmijKBCHhnLmSUT5E2bVvs0JYRZE
         8RtXPrBIwge+bKomVQhHE15hhDpxIlAbTznNzJOCDH5ql/m7TbUEU0PQ+eLsL0pGQo0/
         Lrbgp0FILtGRoD17nZERicru7gRjZ4flJWjVeUKPgQb+sdKaCqqrkGAmuwBfyg/LY2tf
         5JdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        fh=jFMr35TSevGjMWLzEXn2ykrcm6T27ISGRCN4CW892bo=;
        b=lBiMtxsCMA9eJut8goAhD0UbVCzPs20wJ9bTLCcmt0exQig2XfrJm7YIYFEm8IBVSK
         N6slmyTNvrDdtL3SOd7oCQtipgBVUvytxNN4qRxoUYsBWg/+fZ6UHoweoct+p/gTPd7B
         B78IBSv/XDDEDiMj+TYCIPhEbK2ZMEcw5HXh3hkjCBfQic10Op9fPCxvk6kxnKGtuPD4
         0JrR8FmQMVBHBV4oYOepUSUtxVLUVZubo0G6juubKwj6jI1n20bcdp7EbnrqYbMs2VDf
         5UpC7JpI5eIGiEYAWy46qSWxJpoZKJ38nTYLNRWHsR/vqDwDllrm3r+GFiXY90M//5Lg
         7KaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368844; x=1793973644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        b=KdF0T0IqR/9u+is73hbl4kFHKP1fyNZK4lGWMSIf9mV15FJOdvxLhao1WqkAQC2D4r
         Fip0tn//jq40e8dEZ/0qfqbMEXM5J6+2hR5uKZXS+T1iy/tD4ky873EDCXyDcVT3x6ZE
         jFWlUJCa28Q8spZsHdNZy0IjkRXwoQ4qXRHcXaZ9x6R1GLHMZWU0wXplIfrZgNjYFCTW
         2fG86BkFOY2baLKHrJLEpHRDmH7SAD2TF8gHe/cF14+aqt31WSiBzHfUd2kybgb8PvLl
         vWmL+riRzG6fVPJ+j2kTTOFQ05jxNR78gcsGiwV2Zbd1ENhvQl5UTk7oNFpPJEKVFerb
         3Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368844; x=1793973644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        b=bk30a25zL5zWXFha5TwLUixxC/DIb8Vkx80e5vSY5zXefp6BmU4lcKZfBiCUHUyZQZ
         sOBG10VyOk/BinkyZrf1j7dkpO30Atm/nOIy4cFqXblK8KsiW0l+HVAADf94SNiB19u6
         TLJMP7Cqd70DwDoUvu27uDyTBjXJap+byD67Y+seF67eHbsPbbDJNt4mm4fv9uWdbyBj
         quiJfjsfNCT+JyKqi+ZSXvoAT/Gj4BPrkF0Gyf77QJEbTGMOmAbcPYNYHyzw6/zf9jEa
         VZgitE/RJzeWXCl8kua9APW+ICTtLO3bVC6KWc+GUCmCVp0A2cWkJctZAQ+pPeLfhMdW
         iwSw==
X-Forwarded-Encrypted: i=1; AKwUvBw/dFGKhBM3+HhPFKrcruOTpCoRQgz/9zuK5WuYRH/BEP2NIfNOtpIZIjkmSz1RQOlhpyZW5i3N1oBV@vger.kernel.org
X-Gm-Message-State: AFq9FYKfJm0zMXR1/n3820n2zdaeccNcUF1opFvem6mIdtWThKJyhEIu
	fljhySlLf9rNLHQxS/TRpSgKxBBdEVTfYL5kc6l0y/LiODE5hfNPd6nFKFrGRREK3d14Yf7vMXF
	wOswB93sPtURihAQFCFL5Y4Xng9uC4a3WErq7Xas/GtXo82Bs8NeNrOppFzEcT2ALIAcqWL0w1/
	R4QYkYW1u+u0fLbl94/dchTRQ7SFbS05kLgMkpEhQ=
X-Gm-Gg: AYBFou0tPX8+OC3otwCnC6KEeVG9lcZiY/9OMKloaYb7QBrS5Cc7dZaJKt3ZfAhfXq2
	BOIBfOJW+Q6nW7pn+9F5yO/0mOPa1uLIc0hnQXaADic8rm1sowz8wBOjirbuCTIcSUIy75qFzY/
	TC8ayBLxYwBa/yxJKBSV+2WZpT0ymSchDSaUrANCnY8hZHsKJH0xdL+ROQVA==
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2eb364552bemr27295775ad.34.1793368843557;
        Fri, 30 Oct 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id
 d9443c01a7336-2eb364552bemr27295385ad.34.1793368843102; Fri, 30 Oct 2026
 07:00:43 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144002.10606-1-ansuelsmth@gmail.com> <20261027144002.10606-2-ansuelsmth@gmail.com>
In-Reply-To: <20261027144002.10606-2-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:00:30 +0100
X-Gm-Features: AclHuK85D2yzjqjadIBbGwA5No_thmVDaWhvxFw1u5vv5w3KPYrH4xdvCoOE_dE
Message-ID: <CAPx+jO844b4kY9vbJPJj+N5H9cRJ4TzT52=1yU-Pi_oxqysd8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bRlIPtyZpealGHpbEFUQj5CVNL8lBABH
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4a30c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=5vCY4yJ5Sko5zDJxFQEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX41duGGkHwSCX
 eiIwmi5iQG3mF2+gUZEbBm2KiU3c1aNlc+2lbgWYCLdV/a+5AoDtgXG72Z/6z7KvKDp7sNi+KHD
 zAdcjgTeJU2/fJ/edpNd7gdkEA3nuFmOlkFCm8G9tRERPpoNRGtn5xSGFipWEGWvQXuSqE3/ovT
 n8czQfzMASVRym/8RyxPBOZrtZAN3/I9KOCLkdu41AyZ0YiBQ/gtzhljsDWSaJOfPfEe8i9/rEI
 IW/IeKNkk3jAM+m/KOtzHcyLkW9pTlv4lweO/YUYF6I7rFiUm6BoYf/8LdYbGcv1kd76Ya3kIUk
 x9K+4NWDUmnGJ5MTZF6Vi5Uig8uu9FoQt7lkZrH7kXgRMHBGWqOg/WkceKg+EQydRfFbQ5vsoJ/
 i2MifZhE6+0UHyJGsA/jJVFHazly+zrfXAehZfOIOUSHJUKj7KeUedP0qYqXqVwf10m63YY0qb/
 UQWcf3iD1wTadEzbz4w==
X-Proofpoint-ORIG-GUID: bRlIPtyZpealGHpbEFUQj5CVNL8lBABH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX71YENFiTz6bB
 SzpQhfzElURkLlSMI17GRR1dNb2lSb/XKIJn8vBO5hbEv+HPCJ0AR4ZMmhFdg0qtQp1rDrnfxvC
 6AEk0hChCMeW9XBA/WJF1XK0B/kR8uU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300054

On Tue, Oct 27, 2026 at 3:40=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
> MMC controller based on MT7988 with the difference of having a single clo=
ck
> controlling it.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 5b160fdad3f0..736cff2783e2 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat =
=3D {
>  };
>
>  static const struct of_device_id msdc_of_ids[] =3D {
> +       { .compatible =3D "airoha,an7581-mmc", .data =3D &mt7986_compat},
>         { .compatible =3D "mediatek,mt2701-mmc", .data =3D &mt2701_compat=
},
>         { .compatible =3D "mediatek,mt2712-mmc", .data =3D &mt2712_compat=
},
>         { .compatible =3D "mediatek,mt6779-mmc", .data =3D &mt6779_compat=
},
> --
> 2.55.0
>
