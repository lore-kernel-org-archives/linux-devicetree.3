Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592036;
	b=foSs4HWYAcSYqB9g67qr3rtFrJ/q+Mkt/GjUtxO13KTFxh9aSpUz+8Hu51JcpKGJy7/M
	 SzOyeLRqXQwmAQvX4hq2rkTSX6KipUf+X9f/C0RSYN5DKhZ+hBh79f3eS6+j61bo1e7cw
	 GEEU88g00BWZ/ZPD2QdiRpajw2fx4mQNIFmZkgzFzDHDZdXajxuUv+W8UOwCFy/v1cXHa
	 BcwY2LSspXRyfNjSRWy9PDoxGzWLX3pEB816jWTU8bpp6+1kG1y4BpoU3PPM/GWfM0xPC
	 Rxxna8xuI11rHkzqhnaajWW6G1FaH8lezul+SjK9QSqjT/7B1rRawGTtjCX81sNo0Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
	b=Rm81exl4EPzbYdbfSJuBPrl27Fo+9IHTM3ZZL+JHNBPzZaWccXerLt26cCyLnh4nhCQi
	 eQk5LVZZNKbulzijeVfe+N8MHV8v9lT/ZmqX4E+plAi069lNNHvbpyjh0T1zpHKbSSLpc
	 U2dypTUCLY91yd4E/IorZKaeOorhx590OZ40GkJw/NCNkd5+ap5rKDdACdzJAgvFzy/XU
	 NiJyBBepOoDycopVl++W6o1HfVLOo5nn3oj59R/v/EIIiXHSeKdbW4YC+/6eqnQSxO85s
	 RhiLEEpq1/Uk9Q1YOS1E7E8JknlbEPniBjfauYK/B7t611DDSwrl0YE1NtjRoq8+x2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLgYD711;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c+/JnLdQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6613606A897
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6613606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLgYD711;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+/JnLdQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR1751011389
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=; b=XLgYD711Nb6RdnRZ
	pQM/51Q183vY/GeyYUbr8tGR4RkZZkYV2YZLlpgqyAn6ep8vMEH3k7k5XmsTr6Zm
	dg4JtobSMy2N/EQQcfrNKmRJT5MRHku+6LyZ696Kz4uqWEnfZDpGBQIiY5yMuVtq
	/vvumqxB+tt/zkmIDA6XX7vwN/iLx/oPCpTqQsI6KcS5POxjqi3RVrrQzff1UhCu
	qb8l4Ow38i8jqlUuWr8EBtw+dWgLGU2bfB1M33C6drxYHw5GpzI/bDQRlKe0GEuI
	4xveG2iHz8mEJb50e8UCyeyD2PMSmP8dSapmmAeePBNVReEyHsGi+9Eo+37VDu6M
	5P6New==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdm9md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:47:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05b3eaecso8969275ad.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:47:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592034; cv=none;
        d=google.com; s=arc-20260327;
        b=qFvxkMLSqpJA8gDDGHPdt7Y23QS6zfOw9vrU71UNZoEP/vaYM0qJU2cCh90y84yrKe
         2lw7FRG+/bkqsAARH1poI3nCC4u327mELEkxquDNsts8ufOTzboke5n0UiMMVXhhS9Fl
         +RdLyNEqKL/BjHOKNLGueKvM+KE3BAmMpWf9x6gvPkJa9K4mesen3BL6kfYnOOPyAT6I
         EK3MSfdOG7glxliPmOiXsoLgdKdKJODgjQKyZdi0w/9iP7u3s1cg8MjUUZT5t/fw8OT1
         OaDmMxvjOL1xUj0/PDhpTk20dJC6TTHKUoZhvOnn0oBfwFQW3XQTJzt9UM7qWCHWpsf7
         x06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        fh=OkQJUAbOyyv06DukYxURpC3t9Jf0t/cKurO3xlZ7hyc=;
        b=rPTx9bztYzmKwBT+UCTcwPYtll92fKs4K3xoTh28DXVtXL0wOdZE885A5QxmU6ztWq
         r8cI5oqox/arBdYQ/n779GPdovWo61ysGZZZf/6+98w+DtEiAfbGhAfFUteoI6FbShDN
         Hsf+J86MmVdrmCpJWtzaQtFRdGM4duSZJiZmfqs0gLGFKd+ZmyAN1CaxhRuTJwNC49OO
         bHpd0vRkXWuTkSOtrwLhUdZk1y4D5F4zHrpUZ1qti6xpjQlKBRc8Ls6p7n3zh/+Vrrn0
         taT8dqLg+v4Ro/PV9oxPiuCDcdJPzNcqgR9lOQuJol96antpRVYFCizoFcRo/8sLF3LV
         5gUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592034; x=1795196834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        b=c+/JnLdQhX6F1a7DHfl1cUH4zp8dgXgNYqDJxHsjF5oXW5dxAFIUA7TbUy+LwlDKbS
         CsMFj3E+scMnV5FV3X/fc+fzU3robIDtwnv5pZpyz97MXlgTkHboihJb6W/J9ygdIqpq
         57ACxjlSYOwx2kilV1OKEeCNZEk1oGbH77L16dkR3GO+DFY9esQMICUlXbu1ABQZlfAw
         ffquzZvlNY3Tr7mj/y1D/0Q/Tjyq3hFbhtmpOFYekGtDteWgx1ekN65ndpaD4JFewqnH
         2r0mhhzp+YKvWGdH6rqXjVp4qzcbvu3pCbZRzatdY5BmOas2rrsz4bvdYr/r2dI8BYGB
         OQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592034; x=1795196834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUtAykq3hDRsL0/US7WOum9GrsDms9AB2V3NWupV8pE=;
        b=hqUZq5hqiH1UtZ6/HirhIQPzy0OoIfdguQcW45XOb5+Y6d0zwt4pZiu/Njf5CguVOz
         H2lj3i7Gyfh/KhPb2PL8489QzPLSta+UqCStTFlIu/ZM3CRxo83lUeRhbj+4+VtxpQdX
         htt3bQG1g0suy7+ItRdAMQKs2e10y+tTauOWGNRCjt95QFHWJoNwT3Q94/uoAO9naA8X
         n9Y93W9kfqPIs0/uqBGoz49JuuOKAJ+tps712UuR5RhSBdTzd+/m/FXpsp82Q96YQ3+W
         bu6E0FTEDpDT0nmx/2YYIrsaR8bhLBegcfttOkpinT3bjw2AQCFf+E7Lkr8FdeeppzdM
         m6fw==
X-Forwarded-Encrypted: i=1; AL+hErEAu40Ro7aArfMWA89uK4zl2wCkj3pjs1TzhEliGWPlLyvwwYBAvFlu5BkUJ4kJ8v+3N5c61qhePYW+@vger.kernel.org
X-Gm-Message-State: APuU4Z9zd9Pz7uD5RR8jvGGfARQQCajYve6+H+1h5H9tmC2NzlXd5L0/
	6H6+1f3MLG7WsIxzbpiLvedUXWwpYE9QAV6cVlLOYFZ60EHqTURtp759PUz9csoL3iSh0g3iBxo
	lHiy0jt532lklCZdcELrP0l2Ce8qFnCo4xgKpDqQKUy1R4T/4MMe0dwUaYdGo/AQJtFsRHA4eKC
	l7T48hSY2T1xYyaCmfYjPIL9XBGGkNkSqOFz6dFj4=
X-Gm-Gg: AYBFou3vonGAyE+di/ep7lrH+N/kaxuWbrqa/sw0ydCE8xoeVsdzlkp2b06nMEBj17o
	DH5auJpN4dRL+h4AZYtzYPUdakP8QeNxk9y2aDHTjxaQL2F2/mBn48msys0N3L8gv9FM0TC20HE
	SdZ6vDrU4fFNIz5iRLq1xFPIPMokEXS2LuacTVDW5t4iPntACAC2kOg0ptOw==
X-Received: by 2002:a17:902:f603:b0:2ed:4456:fb2a with SMTP id d9443c01a7336-2ee0dedd363mr31379305ad.36.1794592034238;
        Fri, 13 Nov 2026 09:47:14 -0800 (PST)
X-Received: by 2002:a17:902:f603:b0:2ed:4456:fb2a with SMTP id
 d9443c01a7336-2ee0dedd363mr31378845ad.36.1794592033770; Fri, 13 Nov 2026
 09:47:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com> <6777074.j6PcuT4dK6@diego>
 <CAPx+jO_gRtipR7iuh0D7G2Wi25GZoqFD1JHVbJNmhd1UyC3Bmg@mail.gmail.com> <20261112072146.41218-1-gahing@gahingwoo.com>
In-Reply-To: <20261112072146.41218-1-gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:02 +0100
X-Gm-Features: AclHuK_xZYTfne11hVPWnloCpcRGvh8w3tWYpN49I_tY52oUY-lip7RnFHUhpQI
Message-ID: <CAPx+jO-KKvgRS0br-3QGh6Jt4efWJ+A6YoRZKFV_bcfB+8sm6w@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, finley.xiao@rock-chips.com, shawn.lin@rock-chips.com,
        tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de,
        ogabbay@kernel.org, zhangqing@rock-chips.com, royalnet026@gmail.com,
        abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
        sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
        chaoyi.chen@rock-chips.com, diederik@cknow-tech.com,
        alchark@flipper.net, leonard@lausen.nl, jeff.hugo@oss.qualcomm.com,
        rfoss@kernel.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX7eiG3Eg61Ej6
 1KQr8cji9/d2FJ6AtL+SaqBxsgu0Ail7rLnB3xUN4NER3C2RyT7MVOXqVxh+6qHJ6caFkSZavUL
 2lleqPGMCny0Cw17floAAn/YfLvq7+I=
X-Proofpoint-ORIG-GUID: z1Nf3IGrMcI3Bb52SY3K5lZi9CEB4koT
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af74d22 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=s8YR1HE3AAAA:8 a=9GNsruGHAAAA:8
 a=KA_qeCUQCZmkxMg8J8kA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX6dUUFazwfHcO
 CMO0Ksh5z0RKSzMJOzek2I/AqfNckN/61ZPnT0r/BK0/eA3BO/uNUVshXUBwgOVIgbAndf65FEv
 MMcK48HiLT2/euSVxHMWN5BEweYtu+xPVtkY49Q27twEXk5iJ8elpoGs9UmxtL4eM/tQtt89rGq
 lAzoON5B8weNMkqZU1nlmIqU2NsHFcZsAW6TovSZLxwB4MLVpByh25yHGnPL9ZTeDFlti1iQe6i
 Vnl9oSxM9uoHxTZ549LDq2ixdttP43WG+SCh9HlOku654g0fnnsqS8d8XDLGka1s2p7FtW8lLRO
 LUrq9wBA6xTCwQKIrVYrvTpr9dsem0nTiC/hGPfkA/kGqCV0l9EjFNZ+Sm5FUFxePDIbufBxtb1
 y8TMBkKpcISklLkIlEOqE2sT/ALBI4ab7ncC1BpXo2O/ckjUhaBsoFKed9lH17vlVvXqrYNtuYZ
 aAgL4AMgbU1CZ0DlcEQ==
X-Proofpoint-GUID: z1Nf3IGrMcI3Bb52SY3K5lZi9CEB4koT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Thu, Nov 12, 2026 at 8:22=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> Thanks Ulf!
>
> On second thought, I think it would be best to drop patch 7 (the
> binding) and patch 10 (the reset) from next. Once patch 10 is gone,
> patch 7 is no longer needed either.
>
> Finley Xiao from Rockchip pointed out on v16 that the reset is not
> needed, and testing on the current code confirms it:
> https://lore.kernel.org/all/ca90a994-70cc-410a-902d-5c4c0aacc9b7@rock-chi=
ps.com/
>
> Patch 9 can stay. I will send a separate small patch to fix the delay
> table.
>
> Thanks!
>
> Jiaxing

I have dropped them all, let's start over! I needed to apply a fix for
the rockchip power domain driver anyway, which caused conflict with
these patches.

Please rebase on my next branch and submit a new version.

Kind regards
Uffe
