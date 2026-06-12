Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A43F88B5
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270476; cv=none; b=QEtdy6CadsoZkKq7qjmUAMDxChCyF9VdEVDHYMr9r3w6NTZfsmVBJo5wNW9VADEJPqP9nGLGyGQod21Zp2e9qqdntnfZB+4fLWBEg+2NPpVgnn+4TNv/LNNgmGx5lc1FK3EEBA2HORpNX4OlzawTvDqCgdH06zvmcILzk3FYzP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270476; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNwSRvnFgoUqns/KODnb6LksYdK0cO/yuRxhwSdcMJ63zTKzE4W+xqPdJDbG/tVjcWQ5KvjwOTZVCzbuxfGeZUsZOa2xnApoKW91Z8WGNLyO23IBwCJWg2PGUgdPjJKxPIMUN3ivcUnCroS6lR3pZlG1EZNXiFDzwwEV2nqBZaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0ajMPkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXmJpS4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0ajMPkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXmJpS4M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj5aM3630485
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=V0ajMPkgVJ7WbuHW
	I9TlAHw7olRDXvBREzCOJY+47G2/2sELBRvv3TzcVzlAfc9MOM4WhBUsBa7V52Ae
	TMU1y+/PAqFWntHUT453BmMdQLJQvUe5A23KHWzxScFUiGlfrzKA7bXBVVQDuLx7
	S0w0mfTBqJ2kMs0gN1NPXUtmsdVIVpUlUGvSwwaif2IlmU/y6Yym+nX+XKkq2J1Q
	CicRK2ovRrFlTN82spPVbkzbYMIIzr345jYykfUgHUHxfwrKkVvewsj3wb8tzzlA
	r/oHgyqUuGgRHHoOvIj6ATBEAMLtp2ry5rTpj7P0I4Y3ozHQkn0VvHEzqaHTDF1a
	TdbIkA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165bfd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d7e5ac77so392847241.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270472; x=1781875272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=MXmJpS4MDZ8yW2C1lySmFn4os85x0KqJs+F0EHHPa52WDcHdLSy0aLfZN/KUUJCRUr
         T0LWPlfynV4RybWXU7QtZr2eMqIMi7OIxB+FC2oqZ82gJcuiiY8Rk9jw8c8IrRYyWvGk
         Mt94tHmsIAMh5VpeQfLZzWTvZlqzHQGXY28vI7PTkF6mtEfZwBZNtmyFhQMup84ETDHS
         GzoF/XUuKem1Io10arjV7yEIDA953xOpbwbeMsA4GwsU7kWYqRI5vw7pfLzGrZjm9tJf
         xp5iWeK0DIsYeCgf4ebEZucDrDmxRPML5LGziwtv40FBGCEaSVLvsKTabKEeMGDp2D46
         zy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270472; x=1781875272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=lJ37tgpyLrZrZqK7zKBgt0ZSZyrcQkmt1qggtSGMs9oiNgCEG6F1Zl1Oh+9zvQ1sDF
         srYae7yGoukTd39fDA7JghaknbkxL6BaFByq4wRXqTBxJwHqBVctngWBfYlbquPUWiTl
         2n4gvR/AFr8cx5n8ugL6WvU5Uy9gzjKxS2gVQLS8aM6l3fTGBabba6dNYGCMaY0fW1sm
         yQ34NGPu7csd9okeQ1eHWAG3FsNO/6AbvppIDrGU0qhT8LbbYCCigHgRvVFV4o4HfCwA
         wvPgln2rrx/lB9CZfQcFkkx3wT1XTaUrdhfolw+qZlVQcQBbXjq88/vT9IhSqdymtFT6
         UKYg==
X-Forwarded-Encrypted: i=1; AFNElJ9pF1E0ihm5N6EmmMlqbtZekBo23Azmm/rlofTS+nvlzS2YDTlsf/168CDT6lCreeF7YAQ6/bTBA7Va@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2HSjBkGXc8HgtG2nFZPFfPNPPQV0BPEcSMVqmhebptTW+yXA+
	z200xnVIYdIb8MoYLuZgWAPMXTXzZ7PRyV6fpBBqbZfUrhpMZMcm7UwcJRSeJcUEc28cF3XDSWr
	maylnKB8osIMLo1waqdNXEod/S7j6xGNQcHjSGiFwDe0MR307EB3reDewOckxX2vM
X-Gm-Gg: Acq92OEcgDQ/hxqnT7GEgUmt38bZKhu/EUkS182+uog9AiSC56KAkg+ekJLVYVnC/tT
	oMRMU4YWY43Gg/HHsq/CSDInG3GJDGVlWQbZh1rza2aBzEfvbo3pu/MQvGh0YIEI2XcEhPapbIw
	FsS6LleYUe1kPoKDjHNXmte7vwrlO3y5u0F5jjjXi8IKsThRPkn42sgxl7ixALKZLuXUBaISXGA
	lSlt/UNyCFKm+mJWm5J7fzYntbgJYNlZqDhuwtEoUWl5WqiRj83fMXsfz0bnVZ97uf+PTSosFvi
	2BouszURMEojZ3tgluGiIRxhZSOzDdSr7WK91vc40GTK5UDSHrpgU9MVzhwVWSC82smSKLVypB5
	XEMCVu6cSPx9Ij+4s+72+GzGduhRADMVS0IYkcBVuAbbNhKQ0Holl/9PNWCEHgP758CrswJXNWc
	eDkIQJrbFcJgLHnZZclyX/mdEgVpXCXLcrFLzqPHjL/5LLjdL6ygeyoPpKgquilo8GNdZYXHQh
X-Received: by 2002:a05:6102:dc6:b0:632:88f6:d6ae with SMTP id ada2fe7eead31-71e88dc1bffmr1060567137.22.1781270471675;
        Fri, 12 Jun 2026 06:21:11 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:632:88f6:d6ae with SMTP id ada2fe7eead31-71e88dc1bffmr1060437137.22.1781270470888;
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:56 +0200
Subject: [PATCH v5 4/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-4-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX74cmQgTdDeqB
 ZPNtRBkIRhntcMVBg/2++UQSpefQ85nzSygfzIjpCIP/R6sV7woNlGau+xfpCoAazoRl0ZB/HSb
 MLYyTSJCzKQZxkJq5lbpq7d9N945BkRs/eolIxOTZ02X7B2/2/ofYTMSIutv2ni8GvpxmR+Htwl
 mgos3n1/rkTYeegi/6y553UddZT6j5gnPNJcmHtlmdFwzUojvj8VULFZYfYTAVrChpNWmE5Dgvy
 xSjuccInwAU+JmsHhFkVTyHN+imlUDJbyMo0SD2GCGhasfVQ+/42d9tAEf3xCwCVKLiQFz0tQgp
 AeVIYpPu/2vWn782ZWDEZ+/UnZUlvU/lLNybQ7KmYE8N64JAG98YV7j9N7n65ZHvkDhf8h+hlJl
 C7TDExZIO8MWtO7xZfYtyVzsIQirvFrGAmeOh3WoP4hwxXPqycuTwiOp+rCqr97p/ZJV5v3FljX
 wzUyw8mSfnHSjJOP6fg==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2c07c8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: JgxbG43_mZ4reR03n1NYwTuN0Ga1co-r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX4J75Dhk6vok0
 puVACoJk3muGUP8cCQwqpaIjdQBxJNv0QzpBLLDkaggt7jbgVhKe70nwDjRMlfg+/DTvNCdKWZb
 74099Enompt3qY3YhM4l2vTTKzi05ww=
X-Proofpoint-GUID: JgxbG43_mZ4reR03n1NYwTuN0Ga1co-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1

