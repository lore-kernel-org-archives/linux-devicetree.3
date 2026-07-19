Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58525190473
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784476669; cv=none; b=UlBfbT5HvtoDKSDdUlalJfHo5nZiIpe9NDalw95fW3Z2ySRpmp+vk30Vk8uJDM56q97SojY806e1oluSP93ywggLNLNHdYKJ3sG+iZcCEf/hwij1qnd6YZ+MEy+Z+c+ovd/76Tb7XEbtDHBDw7x8bsO6dHDUGJka106Y1FOsHKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784476669; c=relaxed/simple;
	bh=7rardkyifAR+2AT1JfxqXWVC4DUlTbqXtnaIiP3Z28I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LKYM/xPRrJRYwa2XMwTlXgaG9xpBiIi0LQ5vdgmxZSVei1cUeWkvwgpTEOITgK24MXBNRW2kU4g8hUQsN+ustaa+iUAlXO/cJd5uxBtJr1amOM6b95nEg0mE94AdG8OnGltpoh/Ecoz8qBFqnFZFvvBIA1WSUbrWnLPWNQvFFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftim+XxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0lPZeCY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftim+XxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0lPZeCY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JDvRFB3608939
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 15:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=; b=ftim+XxGsBGn/Z/i
	2qSIaKotx0a/S6IVTcZ8mCpD+TJSdM7cVf3thKj+lcjqcdRsRRbvk8QL6DCgcvw1
	iUHG4u8vcL5iGUTKL2LS1rjzIewZpM+c6wScvP0eDc25CS6ZkXbX1TQFePyakB6p
	pKc5dcMaXHx7ErRdOYLShzsJQA6FObdiSd7g5o93tG3k3SRQVJU5GAASmHmTnESn
	196TLFl/m6X1Va/3fG6KwgWMCGIOmCzxjrUT+3xf774/W4/1wfaCSDruKLYBNaVm
	3NeWQRYTFs4jkCplyV/giTjTro46kXYcpsqc4M59EWtVW0kSobe1sbuEJbxbJ4XB
	0UnUVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvu0qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 15:57:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-382befb9555so2343914a91.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784476667; x=1785081467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=K0lPZeCYff8qHMhvlK1EeCn+PcTZXR/D8ygxIhrnV8qcCtyrASyAJtrdqCMcTSTSLx
         6OJNv+cWN3d0MQWOKhnvZdC8Oyq1wrd10W8ih622zINrvlTG002we9RT+q+UsRwsrpdY
         82C2CJSRXCIxHmn8Gxm13UxByqw84ol3UzTQ1p1V6Fzb+rHZIWUgYPsYs489FcEJ2WYN
         MVI/ra+5vGiJRr9m5gbmWmGbZc1/bpXTJOau2sp0AlXBXAtRJyzjC8ouhvCF1BIpsVh0
         A5KcC8eLTw9JBaMtvODPkWtP4e7tN5xVX/rW0fuO9L8ZiFzXpxem2NyMByShhw0JwhSk
         7O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784476667; x=1785081467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=AarnLjlDK5rpip2yr7e0cF4JjcL8QUtj8EYn4Kf211UKfWLOfq3WurappT3LqiSLZB
         y3ep/F2INyxmH4KfuY9qYWKIwhcgmXDOX1pJqtKyRoEZKDh6UcOSoayJ44n39kA+Nd/G
         QqpJ+RGqq6CYgo6AU8uuZagUu76CPmtEpxKbcNAoHtg6rESNJcDhbmtlvr1iEDei+u5z
         IhU/zJQueMty5uPicAFtCXz5h4CbHpbf4VhYqyTMMtOjyxQYscsqPWYCdbUvll7aoWbU
         1uwrPyO6jDeCCQyRz7KGIzHLaMmHU0mT/Kv17Kvy2lkg+asOPRn8Bsx3wxTzQGcy1kv5
         RExQ==
X-Forwarded-Encrypted: i=1; AHgh+RoW5iDikTwwfGzqjac/hgE2Ag0VjDR3KS7sKwo/EgJt7AwXOTkcpK67bHHTiv71OKFdDisNk30gK1iy@vger.kernel.org
X-Gm-Message-State: AOJu0YzX7kDL53VehXd1nQ4b8JOjM+JfBgs0meCQAIXzYrTHW/6i3mF3
	VzSaQYArXN4+SMP6QR8ItTMFV7HU8vQ2bUjjjDIuTsuG5a1RXxusOG9YkASHZPk9vIQfyDIVzZI
	Ic7a075QLE8UvBdrlKt28mwKou+sJ1pkYq8m82I8sVAIER2pKsIpwmRyEPK7EvkiByjr6Dfbq
X-Gm-Gg: AfdE7cknYzfo2BJq5Gz7WGAXvBrf/rDFunSOADAvfV7RqdJitXloFDYJdN3rYTkCqGg
	grK53sIQvAOEiPNM0cwwRLpIrruUZ+itKIJrFeoBqLSVs8POlqPufJ6igCepmom9mN3ZoCwVsUx
	098bJx+EfiCbd2vZPnLuvYHONoaUER43Y6+TFkXnSwkOUWN80EsxGREREcqRjz6hw0oE6tHlR12
	BJKQ/N0X3z/zPtdA6JbIm9cBefzv2kxRyy9hOn9pCKiLJN8J+W6Dx/jnX8qdb8rzRI6pKIFhRIP
	p+9s3Br6JW2LdUEEDYIwOMBb7LrkB9tye9MJaNx/uAWG9dBxiNRi0KC4ZG9pIw9QLmqc3p5HTpt
	xO40Yi7I9COmYsoOShuEXMR2t3KGA2858fczxL7NURKtoSJp9XROPKmNRpj90fLiCYrtvurUxSh
	vKNnAOzhX/3ond4ruFy3zs
X-Received: by 2002:a17:90b:134d:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38e4b697024mr9059729a91.5.1784476666829;
        Sun, 19 Jul 2026 08:57:46 -0700 (PDT)
X-Received: by 2002:a17:90b:134d:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38e4b697024mr9059720a91.5.1784476666382;
        Sun, 19 Jul 2026 08:57:46 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm33127054eec.5.2026.07.19.08.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:57:45 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Sun, 19 Jul 2026 21:27:25 +0530
Subject: [PATCH v6 1/2] dt-bindings: display: bridge: lontium,lt9211: Add
 lt9211c support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-add-lt9211c-bridge-v6-1-e56d22152586@oss.qualcomm.com>
References: <20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com>
In-Reply-To: <20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yi Zhang <zhanyi@qti.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784476650; l=1545;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=7XMiXr7D3fC2Of65x2F+DhMxVAnk7abheQMCzBYJB9E=;
 b=1mg6j7F2+7PtEmJRYo6v6QrTNu0dH7Nea6WFgmNwqGUIDgQlEp8KMlM/kGcs0y1OsF/cY9Kpd
 S7tDzN4aD4kDOHmiMsMFgY/a5BaSISxYFYevgLe2Bg04UiD1vGE2XDJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: P8Vk1f6E0jQXJaHdsknMt00Q5SptjVV_
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5cf3fb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UcubZVdaWCKl6vSfqw4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDE3NyBTYWx0ZWRfX7lSId0l8ITd1
 z6Q148PMVZV0jTqkTRto4pELc5gEVXx2TTlfW0Ajckb0MN/bbkevn2bzHJ0o7hK18ScOles5qy5
 Fn3Dyq5Ny+LX4CmuRuWg21NQXwTn/9yDo1rUqSfRR+Avr9o78jsrUOXEKTile6YTpiUIips2MyV
 VfCRmhlzJNWrP/mI/48QOMKzvmmmBfnKAsjeqU9QyksXjfQ7uZVGTAASKZYJxobSXoEX9Ch/8Re
 CVuTVtoXE5Lw04c5YVK0dodEpP15WA/F0L6LM6Lzcm3MZQjZTdtDtLghwe9UZuHRuu8aMNiPEMm
 G5Zkje2ryQLSzztCWaQPGXApgPOfkBZBzE2a3SqBuYG3U5cx6TRA59XjtjQ9tMIL0EC2jHYA9Ie
 c6U9dTrzcdXF+/i2JFbJduW/OMJs2uSxnfFyf7VkVytoH+yio2cgCuBtr5FutNU1imaR3b0rn78
 fIzXJzHso+qn6Vsc3iw==
X-Proofpoint-ORIG-GUID: P8Vk1f6E0jQXJaHdsknMt00Q5SptjVV_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDE3NyBTYWx0ZWRfX2e8iKARLyP/U
 VpsjpcIm23/+QLYiIYmbGXeaoMtMLeker4syVgDE6N2j7GbB+YEW4iyPaTYnUeFjpPPSUa/fxGi
 6ZD1OCEhBqLeuqsaWHlHMVcrSoqawLM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190177

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add binding for the Lontium LT9211C bridge chip.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 7cfe92a8bcd7..de61bda09db9 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+title: Lontium LT9211/LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
 
 maintainers:
   - Marek Vasut <marex@denx.de>
 
 description: |
-  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
+  The LT9211 and LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
   or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
 
 properties:
   compatible:
     enum:
       - lontium,lt9211
+      - lontium,lt9211c
 
   reg:
     maxItems: 1

-- 
2.34.1

