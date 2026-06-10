Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96F312826
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099315; cv=none; b=toE9M8o5A6u9KeZXvUgg77nI6CT5uOe7+pN7vmnc7DpX6f1Phy+iGiNSU5pFK+o1h2F1b+TqYjBkcxLgV/ZqS6KNM49BoewgRaPR40dMgRTsjWJD7NX5jUN6+FqgbtQDn7G423AFhz60vQGmO+82qBzfKUxlm+SpbKzPKaYPfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099315; c=relaxed/simple;
	bh=bUpiHSAIALXiB2BHU/s8NMZzGgYMNRJvgoquxwx96wQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FjCSI+46F71CXhznpLYdX2BDXZ1xaBKgBzozD7SX7bres3hrIgN7VhXL0miDG3CkZV+BE+sfYyozRaw0ssmmWw13C1Uark0htfT590TFxmpcr9fc9XjBc1NladgjC31G1CdF6h+gXVaurPXBOev5urM/sBJTDglPPyCqKIrwQTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K27YSiHd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKIHRky2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K27YSiHd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKIHRky2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBxva1600371
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=; b=K27YSiHdh9fr/8jn
	4jofhsStGwSbgnREcY6FOyrDMEq8+oO+uXZVHfPtoQhHHedIvepbL4oBMj9Rexhx
	IieGa09kqmZ3iIGvaBHCa60aWgj79CgXT1zvz2NQpO59iQ7veGLxXvdHzW7EsILY
	OT2zHXZLBTtm4BoIq/ZKH3F2w4ev6musmd1KlIHqm5FZtXsyijos8ZZKJxBTfAXT
	fOci2S/+V/HD9aM78jmYDoDeoHfboLFWu1o3SjEu+zlSIT0zuI+Bd/UyV52UPbmN
	ipSyJ380I8pXtEGko2r2o14nr2Ji9smkjWJK9YmY+3qO9LLuKe7ca99LmxdO6LBm
	r8/MQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg1v8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:48:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso69647885ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099311; x=1781704111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=;
        b=FKIHRky2CtjpTs6Lo//6GEr33XTeU5Wx4+RyaYPbNVf0zckHp9KzOm1PEWZZKfwWT+
         oq6HAHpyGWezjxtI3hY1woZ5hwrzDOvDUcU561UxNSw3Phx8IzQsxafHyvfUyeYN5LmO
         L09UcTWGJy/8pBNFezsJVgkTjgZj4YGAdIkAIJfx6/jyx5b9Lyjd2rTeP0n6d+tGM+WD
         ZS6QJWb5GkAXOA08bg5Ip6o5kdt9ZKDTwufFpJI1QZXMWue6rvWXqpHUjYmhZfQNmcES
         uiDtVQtOXnSkRcePkijnUNWJ/lRaC3bc8fZ8aWW3BCkBNfFQ6q2jYzAlwIf2AMMzRzEE
         aF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099311; x=1781704111;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=;
        b=HtOrK5aUZmNplivlJZ6Uel99cCEVd5aXltnmVYCxqnerJre4AL4rMbcgXDv/gI+Cvz
         Kl+VTeHUKI/+D3G2Er8iS2RAcvXQKoH/mP0YyVrOmX7NTjUpcF10bCOdvvmAKpaVBzNV
         7JJVzYrUrVkNfo41XyHoJOvLZTovw2d6sQtpcrCqpF+OXB/X7rEMGq9NUl2qpMR5TGC1
         JxRPBMqb8d0z0/EOGfWf7uav3fOUdhKA+LmtGYfCtvS070pUiUN760XNWF2aubZ26Jxm
         KsuOz1JIkzo3670RyM9c0IufeX56RvqGJyKqXQvHHX5ADpCRR9lu4ZOzrmCDfd5rL0Vt
         6VIw==
X-Forwarded-Encrypted: i=1; AFNElJ9z7pPv+Y0IuSZi5sbDmGvONbmwMHRObuU5+auz1MfcMJ+7j54Q1rggx6Mn0SSe5DJg6SfeSqhS1kUX@vger.kernel.org
X-Gm-Message-State: AOJu0YwM0BAkEoWi0FgbiKLFeRzstIqlCEZVUO7nSynL/aIc82pJcbYI
	9omL5UaBAEXfx1n2dJCzAMigCcsANxggjXIXzJMBDINdQyUjKni4+/MhqLEozoIdxkLw1hOZsbg
	Bw22E8TLPt3hKlAJrpuaZU1W7xO473jOta3pgJDfb8cZe2oneIkU+LdNqknXs5gAsU1uDOR/G
X-Gm-Gg: Acq92OFPClyW53cOXs9PlDUa1aLlNswguvjg5dXjWXku/3uQFPZFJSh7BoBV9VOOuHC
	UJXXAjV1rdjPHkKVnHZSWR7uQUaczt7qgYcGfCfmSivXiH9c7hweVtzt9xVwSCNKBw3aAPsLmRC
	1e1dcgy6JRzd7BbtMYHKg/EnfXiuk5yzWYCMQOSSnGeL8zbxb4zxDpL2qPdGolimK0MCenu4ffy
	VUkxlwX+IklFwEFyCg6IgKT/dbQaGbKXj7k0iuOyqzE2v1xXAX0npjHxw8jWTvJ2dle3vLZeAQl
	zVWMwIcU6f0V2xuyGFLXYbN4e/oNZ8jdH8Yek4ZTfLnDHX/IU1P2KttzpFPRaB8/DGQonkjlutB
	tsKO4GNuwXmnTHm8EUDvmWw9dCjhQMZs=
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr295502625ad.7.1781099311386;
        Wed, 10 Jun 2026 06:48:31 -0700 (PDT)
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr295501975ad.7.1781099310778;
        Wed, 10 Jun 2026 06:48:30 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df6esm270319645ad.48.2026.06.10.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:48:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        hongxing.zhu@nxp.com, l.stach@pengutronix.de,
        "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sherry.sun@nxp.com
In-Reply-To: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
References: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
Subject: Re: (subset) [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and
 update device trees
Message-Id: <178109930423.8833.16452944960716589912.b4-ty@kernel.org>
Date: Wed, 10 Jun 2026 19:18:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: BeVzcszSj30kjw3-RvkDasqLbaDWyVm3
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a296b30 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=GUrLWBD2z8Uwe9ZWfuYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfXwbsDYJVsLdS9
 B6Lu7pM9etwuUazjAjjr486Ooq2bjUSp7Ry1B3LgJv+M3wOPwF9Wyc0gykpli9i0aRHQXMkIgSz
 UBT0OWTYYqq++apWxR5WW+tY/GLGf+f5xwmhZgNLYJbF/uaSMVSXPcUXLhwZabAqRTjxJNELr5M
 3dosXSd+1hgZrGhHL+APaqZN4UA2Nc/r59JMb543WxETi+CGhXsUJ/B2OlRa10pjPia4tG4V1cA
 6T3po1J2MZMPhZAPhS6ZhX9Q5rGIjoKJGMFHW3uPLIoP9Z45N5lqqwBECSihfyLh7SYgHi6Pvcs
 iO47cB0tqngtwrzzsCPFDXVAbjrtdlhmpI/2GOQz3xih59daYW5o1mSBHRETylTl9kQ7PDiD2DG
 FZPwpf1YpeTNVqOmnfFZRE2nPFEPORa6ipjTp+QuXalYvrt4g7rODHqmltYsBtoRGPh4JHqoPL5
 zYm9lsQs88nNVUWizCA==
X-Proofpoint-ORIG-GUID: BeVzcszSj30kjw3-RvkDasqLbaDWyVm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100132


On Wed, 20 May 2026 16:48:56 +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> This series integrates the PCI pwrctrl framework into the pci-imx6
> driver and updates i.MX EVK board device trees to support it.
> 
> Patches 2-8 update device trees for i.MX EVK boards which maintained
> by NXP to move power supply properties from the PCIe controller node
> to the Root Port child node, which is required for pwrctrl framework.
> Affected boards:
> - i.MX6Q/DL SABRESD
> - i.MX6SX SDB
> - i.MX8MM EVK
> - i.MX8MP EVK
> - i.MX8MQ EVK
> - i.MX8DXL/QM/QXP EVK
> - i.MX95 15x15/19x19 EVK
> 
> [...]

Applied, thanks!

[1/8] PCI: imx6: Integrate new pwrctrl API for pci-imx6
      commit: 85c1fcfa740d4c737f5575fc7251883e54227a51

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

