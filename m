Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9904B04A5
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824242; cv=pass; b=eQd388ZWpbXBriwrmCixIx1PZ1syXgrpW2tDqXb1XD0299J1M5RqbjrY/LMvnU21n/A9ukGIKBqrRV6+z+dR//CySjAZYP9aLKDIewS+vgdvGQ8dp2ias9sqctfRTLnx4BSg9ANj4+DbjSAG1aLrBwLCRaU0D78/A9Q40PoyxLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824242; c=relaxed/simple;
	bh=1ZwHYEL9zk034YEl/vwY1GKXAdewDQli4AdtYssr/d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWgfspU3czHn/jKyRYy3yfIzvGpvA9Vl+PClO77m+TYv3epj+gOb6xcBvRW74z4pFTu1Xpgv67zeDil/TKOK8zPsxt9vyG1Mdh2r840Z1Io0wpiEEN8adJcroEUhbCmgyOKteMJwqFS/S0IA+X9jO0ChA9BxQNgUkQsD6gzWPT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMDcUL45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hi2BUywT; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMDcUL45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hi2BUywT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFesP83851240
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=; b=cM
	DcUL45gRuVzE+jNsv8a6qBEwW0YUaXRh4vF8WElxOOIgmMZzaRhY7ruPaoFvy6Lj
	qDSvQ0X0lFxTBwq6zbVb2UUqBCDF+64fcrSBck2BgsxfSY0aPjBI59yBV9SemnuF
	jg4xUoWeLZnUS8rUWRyWRBQFNxDXxI+uZPwLVKKE6Kt+ibWKP7ABv1Vqabb8hEvt
	LktCsN/FQJeSEwTezqgfkoea1A8vPmr2HuWNFVu5BbJA0I7kjDSw9H39g0Z1+HjA
	trgQ6uybg3jafppp73YBth9ts2UVWUjjpterLmYN7VhiHYf/TQTofM+iER1ldPCv
	VDxuL8ErBKA16yDFyp5w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9u1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:57:18 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6713ebbca2dso2382325d50.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791824237; cv=none;
        d=google.com; s=arc-20260327;
        b=ejdbsTTr8TgKwBvL0jYgcmk5xfjOEaQrDFYxra3htwRYaFLybEWOMJW8RNYEXZz4oo
         quWUmB/LaVClSY8FiW2WFg15uEMQmD3IPVQbpi3sofH5kqWhcAAjWCrLkBQzwAOA1ytA
         1weZM1HySudfBsRnvNgvfROEjCuc0DRzOUDLtD6ZKncEH2b8V0wlbgIthLVkFPjMuCQe
         gvkXAMtZgUSd/0md85P3MOKYxhfcSF0QNumdCOKRNu23HK8mJNTx44RC1F5V8h1joOE6
         yTlmRV93JXHWam7UBsBuAKlp7legQTeEr1KWS35F4qRawwO7NQu91WwWic8jgZDCih7z
         XntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        fh=CzZP3v/3Uy2FVu5KLd2EbJU6HBPidL/tZg+++bpdpeQ=;
        b=fYLS1NqoJ+stSxnleIvxfvqQzyOJLAQ1gYdHFuPdW6N6jvJbmDsE3W3YkGcpKmq470
         YaRSEwQPxl7hFtHTgJoo81Or7Q/2PayWx1GePo7XtvZ5jlkatX0jbXmbkj4Ck+YEzRWx
         jqjF1FaijklspKnYjXF1VNUPdYe11VK6KSOdZvXrY6xN9fzSHsEsVuQ0xG0mKjpr4bmW
         m8h60S1HHGjOu5tFEFkKL/D4yTMCE1AVr1KpDfqNe/OQ5rBVH9Gx9NIwvGFwV8Ip0FT9
         Onrjr/2EiS29b/NU3DJITIEyQeVtESrLsXDYi0H6B3Sh8aTom6XHI7AePooAI4Qym9kA
         +qmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791824237; x=1792429037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        b=Hi2BUywTlgZ9RjmglkU5RSF5lR/SAFi6fcOYfDoRjZkcWAI+CA/2lfx0b8ARCeYNqa
         j75pxYeNTYyOrRxiEJqX74Zzn1ZfeH9w1GpMwTSJhzeRs45I2P68E5oiYuO7t5PtQvGt
         I535u7NW0l+ah4Se6beTHEje5DVcGQuA0gFR4eVvmUAh0lV+kSMRiTy4KVeV6nRyd+s4
         ucI5ieBSIUV53DiPQJhDm3o5NYIVBqUfyjlMYrNdc/rQ/bVRuvNpwSWvGSSIRjacDYXC
         UKKUWbRIpnur+jXRakRQz4KPgWReVNhmOfrXgfSLhBWafOyclc6a8SRGQfNDaH57wRlD
         2INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824237; x=1792429037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        b=pm/XrrgmhsWDaZVOInorRVLk7Lo+PM8H4fHcia/Trf4Xy3lqgQgSZdQBaFYUZFMH0d
         ykKzVvSsTmUeDx5Coq7vjRxj2eUvwKqRAS+eA5FgiHDhIjaMlq2YUkc1rs1Ey2REinyB
         RsqPUBDtN/VLEb72XB8R71syCOUloo7Owz3pkR1E2ELZnrenURqOq/sOk+yRZB72LiHT
         7kLWUoD61cPLIKsjiX7kro59IlHMXk0VKe6GVyIqhXwHPZyhkU8jBdsZtQdGLy1KpT/g
         wQvcC5iNqeiYAmn0ro4Zn2QYE+FcBu81lzVfk2Iu2zwFNiep0HOeBosL/OD42jGJNS02
         4iMg==
X-Forwarded-Encrypted: i=1; AKwUvBydS2jRJ7jojTF3nQsBPcYqRh8pORIiroKKokbxVBWHClcFE3rS3HgRTkUKQdoF/E5eWPDf5PEBLVOv@vger.kernel.org
X-Gm-Message-State: AFq9FYJm5BHMW/Cq9uWMwJU2ITJeiuP4hnMY3ad+kieZy8ZHcumvclww
	A2GUCskzAaYZP2pG3feWOZdithi2BcXX8vlm2Fc5juSRHpX9SMfKfnXk40SDwfuDztIJmszVjTt
	zlMrsSABADuh6jmlut+tQHQXCjqiyzIJFyCo2ySnEhBfJk9Dj1OCMNePHgjuyTGudSTKokZqutN
	VQZpzhwgljZhgWPyl0pw0g5/b028zc5YX9WKRwgOQ=
X-Gm-Gg: AYBFou2A4tlLkeQA7xR6FMIgB9KbG7MBsMPmMGZirmhFu+5TTBzpmN4W5uWsCjEiSP9
	mhTfIikbRWNG+Pukpse+5FZQf4OYeZsegmZlc4RpWb9mz6eXJ1dl4grmLdejknBnxJbZRB5lEUI
	DVpdhAgzvLr6oAea8USOpHTJCD0IIl3SpLNDYk0rae1g5DDA5kcIkCmT2k3o0=
X-Received: by 2002:a05:690e:4101:b0:676:88cd:477a with SMTP id 956f58d0204a3-679360586ebmr2314585d50.64.1791824237255;
        Mon, 12 Oct 2026 09:57:17 -0700 (PDT)
X-Received: by 2002:a05:690e:4101:b0:676:88cd:477a with SMTP id
 956f58d0204a3-679360586ebmr2314577d50.64.1791824236864; Mon, 12 Oct 2026
 09:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org> <20261003-dfustini-atl-sc-cbqri-dt-v9-3-52fd8be98dcf@kernel.org>
In-Reply-To: <20261003-dfustini-atl-sc-cbqri-dt-v9-3-52fd8be98dcf@kernel.org>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:27:04 +0530
X-Gm-Features: AclHuK96lmXU1FySMYulXru_-us2zCYXg_c0cpE2EJ1bHEgD2VYJgCcz2mj0Iv8
Message-ID: <CAB19ukFNjO-J7YaLh3_1dAziMtELkvu6mmVbcES=WFWYQxgnSQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] riscv_cbqri: Make RESCTRL_FS available on RISC-V
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>,
        Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
        James Morse <james.morse@arm.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Peter Newman <peternewman@google.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX8kWb8egVnjOx
 6EZwRCh6YSnYtQuUcsoc4iFVQULTrSEgEQ6MkIQ46m9FvoBhAkKLobt4MltXrzMDnJmaHc5Fga5
 mpsoAsORYtAfPOLFYAVqCyOMMZsKJyKuJ3nMYsOPAGagZeOfY2cjnwBuTSYuma5Eas4WFed4p3i
 Pz9dzyDAdcP4sKGqzx8hfCBrFUJkFzUcQ+pFl+GJNM4Jp1O8Irr6DSHR4mAkaH3gB+LCMJeTJ9m
 y6icZ8SlHE7U14rS4Kr6CKVe8LTjZKkafpBftGzlXKuRnXBxvL2/gisaV6/lbWGPyctD8LRzFJy
 N7Be/TWCrDnp3ohFs8hMZuAugEdBYxVT5GeFIVepStm8+u0w5xnaTvvxddHDZfok+oE+sU9CYUu
 MyG4pIS4Pe6597BMw8Z00CIdDK9kpWiBrddbhdiCFRtxtFCqs9j0S/5N0iKt6LtM7ecPdkJpYu2
 Vf1KTDdXjqYzHAORYJA==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd116e cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=WVtwwdpmd8cHSuz7VWcA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX8JE913+m9rzT
 me9hBxsIbJXSSrSRZ/225b2szum6miC5au/7hqaFK7gVXAzXDUL5uhh0DRxh2w9/NUuwGtNi7HO
 7FDzRjou/uiZpTYx2KuKtCs52sj6BaA=
X-Proofpoint-ORIG-GUID: DpN7zGRYqSqnvPeFc93dc3VAWVSB7xCQ
X-Proofpoint-GUID: DpN7zGRYqSqnvPeFc93dc3VAWVSB7xCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120067

On Sat, Oct 3, 2026 at 12:45=E2=80=AFPM Drew Fustini <fustini@kernel.org> w=
rote:
>
> Enough CBQRI support is now present to enable ARCH_HAS_CPU_RESCTRL.
> Have RISCV_CBQRI select it so that RESCTRL_FS can be enabled on
> RISC-V, and default RISCV_CBQRI to y. RISCV_ISA_SSQOSID is default n,
> so this only affects kernels where the user has already opted into
> Ssqosid, and on those the CBQRI support is what makes the extension
> useful.
>
> This is a separate patch so that no commit makes RESCTRL_FS selectable
> before the resctrl glue it depends on exists. Enabling the resctrl
> filesystem itself stays a user choice under MISC_FILESYSTEMS.
>
> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  drivers/resctrl/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> index cac23d20124b..617b813b9808 100644
> --- a/drivers/resctrl/Kconfig
> +++ b/drivers/resctrl/Kconfig
> @@ -33,6 +33,8 @@ config ARM64_MPAM_RESCTRL_FS
>  menuconfig RISCV_CBQRI
>         bool "RISC-V CBQRI support"
>         depends on RISCV && RISCV_ISA_SSQOSID
> +       select ARCH_HAS_CPU_RESCTRL
> +       default y
>         help
>           Capacity and Bandwidth QoS Register Interface (CBQRI) support f=
or
>           RISC-V cache QoS resources. CBQRI exposes cache capacity
>
LGTM.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
