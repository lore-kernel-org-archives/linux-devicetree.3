Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A091D33C195
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742793; cv=none; b=N1XMsJTUGV22qTCb0MhU1NpiAUekqX4ezXfTe/iM1XUpDEH9RNADOnhofcoYLu4kLWftsqhiIcgGJy4nyUh5YP4j0MyhjybPYHO04YaLqluWFOCa+g2G4h+G8FHWf4znhwUXdx5CmXV3cGj+KXJMLueR6UCnDoaBwsKIihRLOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742793; c=relaxed/simple;
	bh=rQgpm1LAp8Ze9rYCKHTd/AfGOAZNzp9NuWlsN6coBvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEeQdVpyLjMdkQIWtJGZy/RNZUQHsccXjrEnhC1sgke4LdgSAkeanD/HoeFuanhfhjs+mnViOeF2x5SiV5QUbqs9G7c6fjrJPEvo7RRv29vCrl3C7Vd657Ejaa7/sJxrsJOWsMGdlQGjYE5oVvpHZDgslMbWkjkwBIZUkEDKiko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBzHC4NM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjreSUoU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBzHC4NM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjreSUoU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKOk2656157
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etscpkg68QaUhE6Xg8B3jE28O6TP7KNlNL8MaZAKnRE=; b=gBzHC4NMLQE645GF
	cX2OP3JmhrauRQHKiSu7RolKOIXPS+Zrqn/tVtTnIXC6TQXZsFFRqQl937NYtKw6
	F347zd5H4T5cQriIXhmv2zaYLL0hKKramF99Hbno7/iNUyF6u88+gETP2kn6vuJY
	BRK7nxtidFAOFT/ML8eBn/PuvjLv06dmtRgA2kPxd2MUKAr22WmJcycwt11GF8Kk
	TtpuNTWHYprPfIJJZK5htlamj/WYMYIJQXeFJzGdZq+24C+TyGc0CdMjiL4kIELc
	enmkU8Ih5amhf9yvzsEpcZS28CUGr7xnrR+f9OdQlLEeIjdwuUoUGLyFh0RqtZ/D
	ri5Swg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7h7fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:19:51 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so61096947b3.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742791; x=1783347591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etscpkg68QaUhE6Xg8B3jE28O6TP7KNlNL8MaZAKnRE=;
        b=QjreSUoUWYg5UaLmLoPjJNMt8h6hagRirqryaLJq3OMXHlQnXMFMuejGyKAc1Bsv4j
         4ngG0THc5x+rynvJx3ENQV5OULo7r/caP7sfHh8LoLUfdWOicPtQqM7WG93jZly9JyS9
         nO+Hre4KplAgqxCsTeSbJ+MQW+HPhSQJZaKMU/3jcxKWcGnhAT82YWMBeMrKAUGnhRZn
         kSTQj0DPOjZ2oaHhJuyySuQqt3eu0kFRvjhUBv695snjggeG8E7cdRZ5s3KyC+wP1kjt
         OeIh8C72V1Fu3KgMzBllMDX5B8psuM9RB56ssbJIr4bF3gNzF36ceKPOYGe+qfWGHgPa
         y/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742791; x=1783347591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etscpkg68QaUhE6Xg8B3jE28O6TP7KNlNL8MaZAKnRE=;
        b=tV3E7yS6vbqZS1IorO66w5jDlcZvSyiIztQNnZ8Ixi3u6cs8w8YU5rFAwqAzrPi+Mg
         9tSHbMBc1vyMU2Wc0I+9ojAEUCCGZTuF9rEK23UKBS13w4O8bOU9Rlr+eLhYkatOM+qL
         qeAeRukh0CiaGY2c8Kb0lgSoRRgszHM3l7/gD1Es0ytB4TTrNCr9S2z10DFIgS5JxesF
         QMEkwmg9wtzRmZFUCxvpyjQSGxtuYciX2eHrowLygYH4pG1lSC1C9RbeU+yymBQOcSYr
         RO+dyvF1SouTDdbEaIjPpWMA96va0FIDxSfDoK2iOdtZ3nFrifuzbwSDESipf3De026c
         GVZw==
X-Forwarded-Encrypted: i=1; AHgh+Rox+8covfZVia4NP7Y6+/Uou01jn4K78469WCK6ZoHEwZzlYHHaKvxe+/5YBCAqW9LuPphZOjkhhKVD@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6Wf/7ck67RLTklwNdgce9hBVJ8d/+keoU2xHcAZxS3gfdGFp
	TyZllMV5HEEz/TdrTaxvV394Cm5h4Fcr9wCAtFf0gwQJ47SJlm37HfSX056/uEZbtarx2ybAbVc
	L7SZVe/CXyDcg5TPL6lVKzBXJ3hYhmJ+fj1QRytvanZHeK2tzbrMD8hLMWOlcDiAxzFBYBCUK
X-Gm-Gg: AfdE7cnMeLLefNGU7HMVYpcrf0iizysO3N/7sIbH2GEEEOuZ7CWGLDD8ttiHJkcvuD/
	tDqNDSRmJxbP/UD1kAN541GxvhBVRCruNdosY0GXjRU8RXE6hsJWdZGPDlUvBJgcwmS43E1RzPE
	YfAyHkSSFwHknuUIVsxCSVYI2luHHw2//dK4mMXtqwbI/AemqTmFbYivTrquKpOimZu2Bpo9tUR
	MIuTyKIcEV+dC3X1pMHKGV+GbUvMu6bjS14YjlKyo+mXnwoduD5DQqQVo1kfEulxK4agP1Dic0W
	5wBTza7NHTxoI97ahidCVI+M/3IhY04Aduh6g3Y2ZSQIFYJgr4cYYPUfjYsNmRBY+twx5alesuP
	+2f3DXvOk7sawGbWndacQZU7HaJp5miV7pq3pty0X2rlRWR6/wYDZ2Fpdpqz817k=
X-Received: by 2002:a05:690c:e3cb:b0:7dc:6863:de6f with SMTP id 00721157ae682-80a6af9b959mr174914177b3.15.1782742790948;
        Mon, 29 Jun 2026 07:19:50 -0700 (PDT)
X-Received: by 2002:a05:690c:e3cb:b0:7dc:6863:de6f with SMTP id 00721157ae682-80a6af9b959mr174913757b3.15.1782742790389;
        Mon, 29 Jun 2026 07:19:50 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:b450:a0df:5898:4058:3dfc:f588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80efaab844fsm14562427b3.6.2026.06.29.07.19.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jun 2026 07:19:49 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Mon, 29 Jun 2026 07:19:46 -0700
Message-ID: <20260629070903.1341-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <159cefa7-63a3-4b94-8d09-6b652002bcea@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com> <20260627190612.27271-1-jason.pettit@oss.qualcomm.com> <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx> <20260628162913.66306-1-jason.pettit@oss.qualcomm.com> <159cefa7-63a3-4b94-8d09-6b652002bcea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX+p7ZoQVKNUsD
 2R5RAOG2psPkvMZ1G4BWY3fVyUkA5xmz4R4TcRRNr/zdUgDqRNMtuAen0W80Y3tx1Q/4cesiP0K
 UGIHKB/XZa0j+d7PUF22+of8rw7FqYLsVdL6F2hx88GK5USO0BtwA4jXIRosChCCHyIv/K4uguW
 Yep/bgB3NcByLE+VKpxZkyvxAj1jIxlYROrE0THHJ9DZGxc8/rjvBcNqVTWcU8vi+i7lqdBhWKv
 0S/bVhWLGVs2h18+CLCjZ2eW47Es02VJe2YEyaMoegcpbJ2sRJiVg3GpUfTa6KYDAP7y9v669EL
 qI/GNEJtscbyxAyGnMImVdP/FELaPMJTnsyC1UFlutKVP2uLRd12ouB9yGPL/cmGQgQfpCjNe2/
 dmD8zhw+OZmHbY6teAdsX4zzVkJNO43GsYxCCpdA2RyFanwNrNy7tnM2ER4Y6nwJosJNnAnsLv0
 0XXT6eYm01iwM3ZxAPw==
X-Proofpoint-GUID: WzHsO0ev8Eke2VSduKU8IKy44DMUj2DW
X-Proofpoint-ORIG-GUID: WzHsO0ev8Eke2VSduKU8IKy44DMUj2DW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfXzksobsaAm4GL
 hO+oDMP1mueEymfmGpMtLQQlfFUmBQRcMpiXVQ6xN5Phhe0kG+04QOZFEiW81mX4GjmX7OmPftH
 mBhpZbQ8+OyFbVTr8xbvrShyKIWcCMw=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a427f07 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=f8nfmbKWDvjpq20I0osA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290119

On Mon, 29 Jun 2026 11:47:52 +0200, Konrad Dybcio wrote:
> At a glance, this seems to be different vs the reference data, could
> you give it a spin?
> [...]
> -	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),

The prerequisite this v2 lists (the Glymur DP PLL change,
20260419-glymur_dp-v1-1-ad1067a8e8ae) already includes that 0x04 -> 0x3b
change, so it is applied in my build. Just to be sure, I retested with
&usb_2 and &usb_2_hsphy removed, and the same result is observed.

I can leave my v2 as-is and wait to submit v3 if there are other
patch series pending that I should wait for.

Thanks,
Jason
