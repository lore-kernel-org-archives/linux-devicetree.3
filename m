Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794652120;
	b=usERPyE9kTUMDSK9U+Gz+kzZR1XR/Uv4RfKpNIguByDIPhAgmVGYHbvfbuQfhDyvbJOZ
	 Y3Lm+n+9OQHvnUqc2gMGVcLrmRwpLtmRBK8bc6pZQ7CW4+V7zKY9rMLwrc2Sh6EEq7T9q
	 vVz0d1wrhlz9q+eXY+AsW7StoOq+Br2lHJyl8OaOdY6fR0wKBe/jRbbN2245fI7NinGFI
	 S0NZ7nT7vq838kDpA0zHSCVxtq/7wUmLnBhNGCuPPCQwTOGNiIJQAsIHeOgrJMSvu5xoy
	 nHx7FhnmgUD7h2AsJj3vmQ5GpAoGg6HE3KWtgp2XbOkhy8VS/ZCWWX11nNptuQeOaUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=;
	b=uOI6p9+vtreu5sS05iCGzLgwK/JiIQwLPR0WsNk5uxKGJ4RlfdjgRM6Om5wMqk4ydXaj
	 MEh0uT//RJVnNH4/oxl9fmlFEJr43tSIXaehoQeq7zG1ZdDilfPuK106t4fbqAOh+/spK
	 jzB31QqVJxrDZKvZPIwP0pJMj1BuuK3GcCz1i5p9F7QhLBaPV3K4Hln0mQakRXcpHzARk
	 cmnpJ6zHyYB+OoQENYRRTyPK11eR5FUdH6kFtHFUTfcquiSa4MLc9M4YvDyX5rJtaHG53
	 f5UvNpGF2brfHbrxURkZT+WTUiaMr5K/J+be+hy2dQpy2NC1Y/qoBbiEqGj6L0HOoAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8T9NsW8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VP54mteQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBDA606A8A8
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBDA606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8T9NsW8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VP54mteQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wkJA1089786
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=; b=a8T9NsW8Qtkzm2OA
	wTXhAP4j3z4dEq5b1dzSux/5NfpP+TGTmcynSUWUjORJfbmA81ixFnKR33dJrCQq
	GP2kYsFuD9U2rAzmKLdGHPffE7bdPQZhJu0c8egNQzVvcOPsCAeZdMF8tJ2kmlNq
	Xy43dqmNrH74x+n4gbouuLiYpb8UIAokQXXb0FYNaCJs8jFwx96+OhpiP0KbcXal
	jtJiyAnCeecDKkv8puFaE76DN+n9V2PzeNEf+BzXGUD780m9Yr2cOho4BJzEtQIJ
	Jm8PKACog5/Kg384ClwTlpG5qjdWDZNyzauDWd6Ieig+aY4dvQbhielPtmhERZcH
	z95IFw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rgg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:28:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea381ce04fso25011675ad.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:28:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794652107; cv=none;
        d=google.com; s=arc-20260327;
        b=KIIcQkjO0xNauLsQYD7RBMa7qIC62g3x+DP01yGwF1nIfKE5r48YjrYr60xFdYGCU3
         QcApKJ+HXwwthRLYXWpsLm72eQYwQH0AYfwcoKmMyfjbwyGyOABWdx213BJkfNzDqTqq
         5PM5JKWM6pIMpEjhNNgsYD5jannPLAWBCia++NPLxEJj80JpINOaIGoTeX+nqqWlzd9u
         rJJkRTVjSZLsnFOlE4RFYvnz5cRAMRmtkABAhGBj1FGKauI+OOAbdutxADik0grglN/F
         Pp8wgKp7Qq6qM7QO9tejqJnvHs/SKpipdUACTOkAmXHPj7dqXX4tSZc0XvZAW4K0zRMq
         kuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=;
        fh=Dl2+pDdm4x9XBycNfBbhwhP1ZVz+/UwYjSo7mvf+684=;
        b=SRoCPzsUDqgm53hxxLJyBQCx07CEb+jYmMRRYaOBxJ6h7caJwNlqsa8VkVhFnxCs7j
         D7s4APgr8br6GBh+VxKFuI6QZA2G+5npPcCHv34sl10ApQGWpM83dL+or4AYzMM4BRWO
         t7520K48gTtgHXdlwG5/E+Ly9Rj+oIr8zdj7MeDebI5/1v5Z/F0v37GlE3tEaqT4I/do
         6bdyBqwNKX7HLMY3y8B8FnWHSkcp8iSf0tfHiDy8UHB5Bi3hPEq6Qi5M0fuv/CItoIlz
         HZdZIeXD2oF9ux1cM1SsO83KoyKL2ZwuxNuMJwtAmTc+AzxsHy2No97+mb+OQT1bUC7z
         8Zog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794652107; x=1795256907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=;
        b=VP54mteQIbj4PeVubyXaSRWDBg905JUoF6WChJV8CxdCYxMXVVh0b9LHLdSh2UgIbw
         5WsHIWXClWxUNeefg/Eovhsrc/d7AXN6/Qf4kq+cCeY5+lvx6YWCb3Ucf+F3xIixIZjy
         iv8RLUjibgHJhkXsV4QmEELkyy+M3Xm2m5giY+q2YpGTdgZLOxj5uBtuFRcXikELxfuh
         AWKU6WsJNmI0A9DcDd7MdwjiFkmkGmuqEdFLdsk7PSBOZbsShqHkpt2n0E/qP+QgEsO0
         68sMloJ1UK1hNOqVVgW9SKjJpJEjjb2KgC0I0kXvhyIerPIvL1IdrcqlqVsIBS2iVvme
         PO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652107; x=1795256907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=;
        b=q9uN6GZ7sEuncHpe2zzgyyE8lR5CyFp9Pwv1PrDnTxdevvPWMmQRcrDtvOObfMHBkR
         Bahwk5FjzvVputbJZh5aAZ7vGT9TPRIkm0ub1d8q4krjGfw48ZxKDoARMMyI7yAoHcqR
         SgitQt3WLV1JWtduOfipzeK5hKI6/7L7MU/gjRwp/7IoqlL8DNja3WRusZAXb7q8OmHc
         vD+bzDlQ6ziUrWpQ28inxv5mJLxo3NObcCrsgg/80qwmjeGfd0dfYrbpD307lP4OsONn
         wYTlD6xV2p6Wb8efr1tIST3tN5GM0yIM0QCOl3O1k3ivneBN2Cw5hzUZWGAp4ZkKwA4n
         EkXg==
X-Forwarded-Encrypted: i=1; AL+hErFiRnNTJwlAP0T/Wrsn790MsQ/l1dw/s1Zq5eaMQf1Xuz1ryq/IPjg5Cc4NiFZm9hWU8fgOPlRCnDki@vger.kernel.org
X-Gm-Message-State: APuU4Z8g9qO/T+5kDKKdPkLBN8Ylk5s2etNc5oJa1nmP/0E16jNZI7qw
	rRxIWqJZBhZ0YG99EVsITfOpyIUXXuTjebkMCDkY+UqluBdFi5Wz4Yos7JngqAXaJr6QXdV6wYs
	b5AbO6FUO+xo6NIFhJyu95RuxQM2wNfQQoIyRzr9lIEeqpD1l81H4FBTr/04au93r5nj0sqdfxw
	7flB+Ptq3hCWpeB7QbABS1HpplZ/x2Gc8OpUdKWrE=
X-Gm-Gg: AYBFou2m6K0mH6EcrgsVjeLVF2yx4ZV9hPvHD5DnYILieUkJzVZTtRFjDAKpkSra4RN
	ia9gsthknEsYXQ70eo53VGADeWaZRU9xxb7Ot+8CXf0Ucv3kNPtGj9NQV94yfoiHgX93p9adQ45
	wgOwzNlJc5vPYNIjHL/5Rns+jRz78MFcKQRUQ0a6KNTL65g6oKg2pVUg1wqw==
X-Received: by 2002:a17:903:3bc7:b0:2e4:ade3:7290 with SMTP id d9443c01a7336-2edf2161b1bmr54625015ad.30.1794652107182;
        Sat, 14 Nov 2026 02:28:27 -0800 (PST)
X-Received: by 2002:a17:903:3bc7:b0:2e4:ade3:7290 with SMTP id
 d9443c01a7336-2edf2161b1bmr54624825ad.30.1794652106635; Sat, 14 Nov 2026
 02:28:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-add-board-ok3572-c-pmdomain-v4-0-15cf8b5a6e59@qq.com>
In-Reply-To: <20261104-add-board-ok3572-c-pmdomain-v4-0-15cf8b5a6e59@qq.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 11:28:15 +0100
X-Gm-Features: AclHuK8CTcJQlL9BkywlS1ynPK24J1pLlK3GHhNiwRM1F-ARTEv9AUD_jeySnPU
Message-ID: <CAPx+jO_88-xLLiPeE1QPjceCBpBuX0ZXsB=-vVVcGmx_6vnWCA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pmdomain: rockchip: Add RK3572 power domains
To: 1579567540@qq.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Finley Xiao <finley.xiao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af837cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8 a=dZbOZ2KzAAAA:8 a=VwQbUJbxAAAA:8
 a=s8YR1HE3AAAA:8 a=JfrnYn6hAAAA:8 a=4uetKMasqe67zdwg2QcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfX4Lf4RVqs70pM
 +c8tPMKoovFgQaqd6Nan44cfegIhgxObphcenFxo7/tmlUrz5mIYAYXwlkhw91cMFPnF6HUkOiV
 5kMub/u1JDrjMXVlD/f0vFGtQasC01s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfX0dP9G6M/v6QZ
 5XhIwXP9juDLYVRyorPQzhrtBymPWyRvOjpWRw4nv+Dv1HUjnUzpN1BqoIJZdAPnAPE3dlvfn/P
 X/vLnvggIv7OdnM+Kn0mvvGttq8rJOFakBFV2rpfG+bwXjaC0eDHfRQf0Imq4ryJJQ/vj1vre0A
 xngBP94HuIujTa0HvIpVaTVvomzOjPjIcRzDQX+6qiH7fWWemz/k/mfL0KucBvfXPE3pYemq89I
 YCsY0QBIwN/6+v+3LqUyf8b1pRGlrycTCpHWE2N7IGyDefOQ9aY/QVn7F61ykRhJFve9c4ynVxk
 SXXnyV7co4mRfiYJBPXisUspX8HmE+mC46cyItsN25UytbkhPDmrmM16fz/kcNKtxKbnIE3tr3V
 rk++gmRZqtNHtFPVcQuzsTFx045PH1QWoMqG/ySrU0PKj1Ho/7sVSpK6Z8ZZihwNCiiQwCNxEwO
 M13NgHeU7/pzmuwXM0Q==
X-Proofpoint-ORIG-GUID: oxsA6re8-1vNR8dsvWwQmMrFyGeSDcBE
X-Proofpoint-GUID: oxsA6re8-1vNR8dsvWwQmMrFyGeSDcBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140041

On Wed, Nov 4, 2026 at 9:57=E2=80=AFAM Cunhao Lu via B4 Relay
<devnull+1579567540.qq.com@kernel.org> wrote:
>
> This is one of the subsystem submissions for RK3572 support.
>
> This series adds the RK3572 power-controller binding and power IDs,
> followed by support for all 14 power domains. It includes system GRF
> firmware shift-ready checks, NPU voltage-domain control and genpd startup
> protection for boot-enabled IMG, VOP, VOP_PRE and VO.
>
> The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
> Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
> The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
> ports, a Type-C dual-role port, eMMC, microSD, and UART.
>
> This series depends on the separately submitted power-on rollback fix [1]=
.
> Firmware readiness failures reuse it, preserving the original error and
> saved QoS. If rollback fails, the domain may remain on while resources ar=
e
> released and genpd may power down its parent.
>
> [1] https://patch.msgid.link/20261101-fix-rockchip-pmdomain-power-on-roll=
back-v1-1-59a45783e33e@qq.com
>
> Testing was performed with Debian 13 minimal and Linux 7.3 on the
> OK3572-C with the FET3572-C module. Shared peripheral tests were run with
> the system booted from SD, while eMMC validation covered the complete
> boot chain.
>
> Passed functionality:
>
> - SD and eMMC complete the firmware, kernel, and root filesystem
>   boot chain.
> - UART console works at 1500000 baud.
> - SD read/write and data persistence checks pass.
> - All eight CPUs start; CPU frequency scaling and hotplug checks pass.
> - Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
>   transfers.
> - All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
>   and reconnect persistence checks.
> - Type-C host and device modes pass in both plug orientations. Physical
>   reconnects correctly select the expected device, host, and device roles
>   in sequence.
>
> Stability:
>
> - Repeated cold and software reboots complete on SD and eMMC without
>   data integrity failures or power-domain transition failures.
> - A combined CPU, memory, network, SD, and USB3 stress test completes
>   without a crash, lockup, CPU offline event, or thermal shutdown.
> - Ethernet error and drop counters do not increase during bidirectional
>   network tests.
>
> Power-domain validation:
>
> - All 14 domains register; 11 complete 1,140 runtime-PM cycles. NPU VD
>   sequencing and startup-protection release are checked.
> - Physical cold boot with an eMMC root filesystem succeeds. Read/write
>   checks pass on eMMC, SD and two USB storage devices; both Ethernet
>   ports pass ping tests bound to their respective interfaces.
> - Thirteen return-value injections after successful operations check
>   idle-exit and firmware-readiness rollback, NPU cleanup, original errors
>   and saved QoS. Retries succeed after removing injection.
> - 124 host model cases using the driver and genpd pass ASan and UBSan.
>
> Build and checks:
>
> - The kernel, modules, and board DTB build successfully.
> - Strict checkpatch reports no errors.
>
> Untested hardware and paths:
>
> - NPU
> - PCIe
> - GPU, video output, and audio
> - CPU rates above 1.2 GHz and voltage scaling
> - Other low-speed external interfaces
>
> Some files in this series are derived from the Forlinx OK3572-C BSP
> Alpha1. Thanks to Forlinx for their support.
> Thanks also to Rockchip's David Wu, Elaine Zhang, Finley Xiao, Frank
> Wang, William Wu, and Ye Zhang for providing the driver source files.
>
> AI assistance:
>
> - Codex / DeepSeek V4.1 Flash were used for:
>   - Reviewing and adjusting code style to follow community conventions
>   - Automating tests
>   - Collecting data
>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> ---
> Changes in v4:
> - Drop generic pending-state tracking and power-off recovery; reuse the
>   separate power-on rollback fix for firmware readiness errors.
> - Support all 14 domains, including NPU voltage-domain control and
>   cleanup after failed transitions.
> - Retain boot-enabled IMG, VOP, VOP_PRE and VO domains until sync_state.
> - Use firmware shift-ready naming for the GRF status.
> - Build ungate write masks with unsigned arithmetic.
> - Link to v3:
>   https://patch.msgid.link/20261026-add-board-ok3572-c-pmdomain-v3-0-70d6=
14d3d921@qq.com
>
> Changes in v3:
> - Track incomplete shutdowns to preserve QoS and complete firmware update=
s.
> - Preserve pending memory resets across shutdown and cancel unfinished
>   power-on requests.
> - Attempt to restore the domain after power-off errors, while preserving
>   the original error returned to genpd.
> - Link to v2:
>   https://patch.msgid.link/20261023-add-board-ok3572-c-pmdomain-v2-0-79dd=
d42e92c1@qq.com
>
> Changes in v2:
> - Split the original RK3572 support series by subsystem.
> - Track low-level power-on and restoration separately. Retain unfinished
>   memory resets across retries, avoid repeating completed resets, and
>   preserve QoS snapshots when shutting down after a failed power-on.
> - Link to v1:
>   https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@=
qq.com
>
> ---
> Raw dmesg: see v2 cover letter.
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> To: Elaine Zhang <zhangqing@rock-chips.com>
> To: Ulf Hansson <ulfh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
>
> ---
> Cunhao Lu (1):
>       pmdomain: rockchip: Add RK3572 power domains
>
> Finley Xiao (1):
>       dt-bindings: power: rockchip: Add RK3572 power domains
>
>  .../bindings/power/rockchip,power-controller.yaml  |  17 +++
>  drivers/pmdomain/rockchip/pm-domains.c             | 168 +++++++++++++++=
++++--
>  .../power/rockchip,rk3572-power-controller.h       |  30 ++++
>  3 files changed, 204 insertions(+), 11 deletions(-)
> ---
> base-commit: 99e3bb2c6f246f38179cc569e38a45d9555206ed
> change-id: 20261023-add-board-ok3572-c-pmdomain-2f02da11386e
>
> Best regards,
> --
> Cunhao Lu <1579567540@qq.com>
>
>

There are quite a lot of patches on the rockchip power domain driver
in the pipe. On my end, I can only try to apply pieces by piece, but
it would be nice if you could start reviewing each other's patches to
help coordinate this bit.

Anyway, this series needs to be rebased on top of the latest changes
that I have queued for next. I will have a look when that's done.

Kind regards
Uffe
