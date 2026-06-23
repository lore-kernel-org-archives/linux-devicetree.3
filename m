Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837A0314D1F
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202319; cv=pass; b=tbvQ6GPJa6bDTow5y1ziQe4hqzw0A7zKq3gJSXqDL3MGzn9VPblD9+Bpnn2x+QKbOLlszZ08S/OHdJuUU043JlyqJHEvC09RywgyNLWrKtFyyxl7lmGCPF+h2D2sN/9jXJVH4HEB+gIB7V7QLI2/JHMUBngOsqB6a0dQgc5br4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202319; c=relaxed/simple;
	bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CryuhT4YK+tm0eod8sLfhGgKsMcXyAgCo62epYqBsJmXvaQpytNMwaHXosGPz+tmvtsMK43ndf68ASEDS9bj1i/sOdtUr8qkEgHITDIPnqD2L6DHfFaAOrXCl/1+5cnN1a7Q7LQoZoqHHEEbPiwpNYw6r48hLdEPmZxpq4HoVbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMTqEOYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A96STHz7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMTqEOYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A96STHz7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6dPQt3631300
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=; b=YMTqEOYzk2G8IFxO
	eIUFRcj5WP0qqlUpu1hv6PH4T5ILuXy0X4BB2MKsgg8/4gFmcWifXRAW9lsW8997
	Vlj9B0/+r6QRm2oWUva/Joxw9jqMG1VxhqKwlbY9afQKGnOX2OaeyhKruNVkPpJN
	jZMyLI6/dxypGjglx0TY2E0Eg3zwMMFsYebYoaSRyZpTEmK3BMmlHpPDIlq9EKNL
	TxAA1IFHIBbDO6xcx/pgjPpdtaZPQW4fDKj9iDzTqMMVJI3BCk3qtUgYzCXk9ZWJ
	D/SOOztWNj1RtDhDbojuSRtASUZLyDa3+GbJtVmEfp0CdKEK48jZ5Den5R29nTtY
	S3M3Hg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvreax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:11:57 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7fd3aa0e0cbso12137397b3.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782202317; cv=none;
        d=google.com; s=arc-20260327;
        b=Ud5kjeembNk52PwEgW4VWWA0P+WoLOzGx4ZzJYaYI38do+W6V9IKISQw65elY37tDP
         GXjXy8ESSbsNaJfhnbmaQvzQ4lNs35szJr5bXYHI/SH4lwMmCwI8IVY/9j0YCMy3TvaK
         TBanQ+KjBEx/nFeeZ3H5DXnNQmgRk9ymGFByn/r9VpWuqPEgupzdCmZXnWLVsfnrwlKN
         Gdi6IctnS0uEGkpaGy2+LA12Vmgzc2ESRdFPaGIWu3NLxB48z2li6ScazsSHbOD7FN8F
         2aEQrHapHRTmbpt3a8Z/vCMpRBoWUTADyJFu5OvkUg8y4T672mjrGc0IZNSWGcUCvuwb
         uAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        fh=mw16aMzIO//nieXKZX42LUgUlCwdNZJuBtTo8olMknE=;
        b=h52Bxc4K8Q5cA13YzBXNJHYupk+p6rdUb010LVa4YE13dMuJ7Nz7SHrRn+/YgMp2Yt
         BWQwIAGOxkU4cJG8hxTytQHZKTgb8b1uC5APKrsco2lFpL+bCEyNpyhL06AIumzYt7II
         4Sq546jubYMymRvtApo7LZrzq9vPLgvd5mYPAt1MTSwaGd5VkrUToZiI+o1pw+lGJXdV
         Cv3YfyjBAliHG7A4ZkZc0m94QeftsSPXZI+ebk271hEJMEqM8W/8MlJFpOzJW2awP2VY
         TaetULNyCeIIWmxsPYwrFO/186XeeXvK4QNWjJ70kNJqEgQf3TXL4iv2jtnHXnY5Xk3C
         poLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782202317; x=1782807117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        b=A96STHz7aOcTuFuk6JxAVUt/HKkprH/F6HS7gkUGPiomu7ctifIZGxBcWxyH+dctTR
         4Sk51KAJiN9+EkB38Bm9kv3B7AXPOXCIschbg+WoOHt3B8A2kllpGvt0EnZLLKZVdBEP
         1h/SVR4ZTXsGq8kEYgq4ElLaQuSVkT+5AQCy0/PVuJYeKvge/AR/iGfVpvAjY+KYd6LU
         SUscPVTTBm8V8VvRTaWlkbA9iatvkEE26BQJB9p7LP8UMt8oS5uuJ+qEJPaEgG3KwPJw
         ZwQ1wk6Muv26+N1rg1/Z68U0/F/AY/kK2Z0S2qJCz7Kqczz8wWsksznKV6GPjU7bB3yX
         C3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202317; x=1782807117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/dT++MYqgW+m8CDwD00mW1wKX61dLEC4z+dBEvQf2M=;
        b=YQ8iPjFT+J8d9WeTNOj456OR2hQpy0BRzRHsp/0XF/Inri4vKOva8UZ97AulRigFT1
         Oamu74Zmv1B+41EK1oNPuGda8lzcVM7vu9ZTsFqWRx5KGXjcUSQM4AZr/4JQLuww7EA1
         /ki+1KEHXSfjaejPIAvecRuXp8A/QOcmQgSUIW/P6ABTZdBLGYGh4G5X2q/0ZAVumEDx
         M8D6IoOOCxdmd4BctjKFOoEFCAHcdDitQGTk4yY3YPCmPb6CKsX48I7ypKZdqvFekqRK
         bYGa/Pl7VSTznobdeVVB4VzlwxTJ4+mvZTo3etvdHPwFP2zM/x69GnZcYmpnhywyJyJ2
         6yWw==
X-Forwarded-Encrypted: i=1; AHgh+RomJVxoGyqpfu1aNRsPl1msKzd5IJPfQPGeHjP1L5pXN3taIL61/0YvEcd/+nJlZyDl+gLJVVjU3Cud@vger.kernel.org
X-Gm-Message-State: AOJu0YzmbuYlghEhQMHs6RdqGMlq/FvvTFj8tlOv8wmCVIhxVDN31YUa
	roSAMILdOCulL80g533BoIn+D64Je/QQAmFBpJyYH158CoQP4aouALOpcipfwCS9FYiLUISpV3/
	EOdzVZlzy+IOQB2u43u6h8il92pTurprKDJ9LLFQm7t/YEkzstWJYU6HR5TaXk04d3YLdpjrYQO
	QLLPr+vHih0LzWWInZRYjg8nCC81RJOUQjVjZsAZU=
X-Gm-Gg: AfdE7cmIxmfMHLXzfo5EVtVn1vCVgfXGhwop6oHA4DVhJKHYAYl9rrbdw8fCzeCm9m9
	b0xAGHQPmftAbzBpI/Y0y/m2CVTcgpTnBsSC0gQDkHpVjrVxNXtgHvsLXWcZG8N68thujXBJnUm
	W3TQ8rHGy54vUP3Nrembch9qiOAlSbKIsuiWa//1qXVrj42/Qwd7tXDb+slVsFNHHmyy5s
X-Received: by 2002:a05:690c:39c:b0:7de:8229:e86e with SMTP id 00721157ae682-806731eda88mr27100617b3.21.1782202317059;
        Tue, 23 Jun 2026 01:11:57 -0700 (PDT)
X-Received: by 2002:a05:690c:39c:b0:7de:8229:e86e with SMTP id
 00721157ae682-806731eda88mr27100347b3.21.1782202316650; Tue, 23 Jun 2026
 01:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
 <5d57d386-011d-4d5a-8f14-901019f3f961@oss.qualcomm.com> <CAC-tS8BvfQOLhwicBJ986UqTTZGmiYDbg5MVA54ScUsYLb-dog@mail.gmail.com>
In-Reply-To: <CAC-tS8BvfQOLhwicBJ986UqTTZGmiYDbg5MVA54ScUsYLb-dog@mail.gmail.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:41:45 +0530
X-Gm-Features: AVVi8CcEIEim4mJtqqqf56j5RT2JtPMKNUIlavtlNFsinkA44--VyQviYnJLK7s
Message-ID: <CAC-tS8DWLz3EK8cOQ84F-2COJR-K7X=snpWxm1doOxP6fQvNXg@mail.gmail.com>
Subject: Re: [PATCH 5/13] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a3fcd cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Ke4LyEce-jOch06ua7AA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA2NCBTYWx0ZWRfX6VscWfh/mpRE
 tR0TFcuSnah6PwjbJHevbZttAUS1oy2ubRstdp6zV42lpa3LGpOAq2LX9R6DQUtKuTywMM2GAk/
 5pdKN8FiPc6QzR686IVvD0pjHG8KiNQ=
X-Proofpoint-ORIG-GUID: gUMHBOqQum-J9z7EhkIrirE2jXMk-W_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA2NCBTYWx0ZWRfX0qEzpFKfVqDe
 ackVYpXWwi/xW3O21COtQatRhV3Hpj/g7bdEMGekCxJuPUTO1/4s/aRcjmIoaG+4WoAUjrlGBHr
 EAue4eB6LcJphppuc2AKh+ZliiXpJS981fq+HpG6vWkcpt6IAhMtz1m4vrPWBxUG0bf01Vmoe+O
 CFFkIZOhCYuZzf13NGRs8WXsRKAJy0lrT8rlMvx2ACi/hCvJDWe0S3xRk5GexbIsAKydARFz7iK
 e0LpABrujWlZju2VV7euP5FfGhqugvwDrX7EdU7M5NpGNn+/jShSCmiqdomw2+HsT4+OmWWkdKH
 VJ24u9Mz6+Zr/C+CWkJd9yfjcv2uhgx4nYEn1LoYM1nGkdMu/BiOdoCwq8yffHb0Rc70iyZjkkB
 Bf5xemzSAqXxNOtgW97C2Bk3e57VaglThfE7cjvh1imdAWoi/tcFGLDPfqK99Tbls5yGF0p7mhP
 /TP3XDyWbOjoOGGlPcg==
X-Proofpoint-GUID: gUMHBOqQum-J9z7EhkIrirE2jXMk-W_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230064

On Tue, Jun 23, 2026 at 1:34=E2=80=AFPM Harendra Gautam
<harendra.gautam@oss.qualcomm.com> wrote:
>
>
>
> On Wed, Jun 17, 2026 at 1:58=E2=80=AFAM Srinivas Kandagatla <srinivas.kan=
dagatla@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/5/26 11:37 AM, Harendra Gautam wrote:
>> >
>> > + struct reg_field cif_rddma_shram_wm;
>> > + struct reg_field cif_rddma_active_ch_en;
>> > + struct reg_field cif_rddma_fs_sel;
>> > + struct reg_field cif_rddma_fs_delay;
>> > + struct reg_field cif_rddma_fs_out_gate;
>> > + struct reg_field cif_rddma_intf_dyncclk;
>> > + struct reg_field cif_rddma_en_16bit_unpack;
>> > +
>> Why do we need to use reg_field?, currently this patchset only supports
>> one SoC. reg_field makes sense only when there is change in bit
>> positions across SoCs and if we want to leverage from existing driver.
>>
>> --srini
>>
> Thanks for your comment, change in bit position won't happen for a IP acr=
oss SoCs. But these bit fields are added with intention to configure bits b=
ased on defined value from device tree or based on usecase. Please let me k=
now your thoughts.
> -Harendra

<<resending as last mail was not delivered for a few lists as it was
not plain-text>>
Thanks for your comment, change in bit position won't happen for an IP
across SoCs. But these bit fields are added with the intention to
configure bits based on defined value from device tree or based on
usecase. Please let me know your thoughts.
--Harendra
