Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C54E8DE6
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054743; cv=none; b=uyp/4knH2rahObXUiDCSjK1x5i6wkGeMN05hIMzz0Rck2NTH28cC23j6Tul5NRHQKw//YniYfqKF+/ymPKTVOz40Mm+3ME+d8+gZtGRgTbx65dLnRXu1PxNWjxfzKBAmwqt4tMULuNzA21tZ/+8KvsDa/hFRAOczOLB24kndkLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054743; c=relaxed/simple;
	bh=CinbcOsRrU+weX/x8DlHfWVx496vQyqNGyiZd765C8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlWmuffODIjNFNkhB3erXLRwMEIAGbS1DWBXNQhFziolTxH0+EfEWnIi3wIAXZVwjMxkxpAlJ2jSUbXCC4lpefSOwLnSIUNG30Rluva9VWgJYKcYGImQ84DK5t3JMcYlBC4V6jqx51SZ8t8NryaE0jRcj//ZF6MpBpaXhZo0jFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGifCXtR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hju/0/LF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGifCXtR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hju/0/LF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6Or5m644679
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=; b=RGifCXtRCpX4F8XA
	ls0qBNylzApN/IOMej4NbtlqZIwB564QEKM9L62Lm+hEkjBplJA8aBEpBiJ8hVj5
	/LvJXWrPZE6q6QgzusbZ8WVYhBhpfrUmuX5HiuBYb/gyblPNst1XXhC29/OjnbwQ
	dIlhBXWyeVtHeFT0EFPVi259KbSFsBr5u7sOTYTXVPyS/Nqaikt72YijSSiRAIet
	VfuBB4db5E5RZBBpZpQHaoVVLjW9PabNIK32s4JAXcyaBbLQZFmFm2qKvZCo9Gex
	XVMRg2oG2RSjdGiayJ7x8v8jd/YinnFtvfUj1bYseyuK7kzTn+IvyFAlIh9FFFOW
	f9MKfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya4g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so1076387785a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054739; x=1792659539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=;
        b=Hju/0/LFuiiGAyyu5GFA1OywyD9sfF8ajdH5eoQf67zLfaal4YImfuOpboo60LkPU8
         ELif3udRZ9laH1H63DEPSU4RBCtTPomBTCFnnTyuCElSvfGhFZWr6I+wd5wHLxlWJ6YD
         d2s31+KbOhE6BUpUx9+vln4brCEtyFq3cRwwmz2ySgmLo9hlxh1Q91+TtdUqVRO6sZ2x
         ojmFUq38fG8BTh9laEv9lUuhswSayHUrTTWKxxAPl/ofFF64AtnJQPgU5F2xMhSyz3qj
         LvVwUyRY8NNCiWTFG+zZOdkQ//xrnkqmDExTDxPrLw/wQSOHXNBgc6PVPU1+v0BppO6k
         FfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054739; x=1792659539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=;
        b=S5QN4UzP0is8kVQ9JPuL5ykU+NDjO+MveJx+GRRC8MUGXR9+oBZ4DQwERhLpicQ4qj
         ibTj/1nI2nLp2FUS/vr12pY46XmNdDlVAetbtgLi7mE7FeBuwHWHvLNELxxkXyKqjcM+
         Rjql9SZBbPsRGi8FY2FIGBEzprbGDLmvhGmXO/Me1DaQF9Wr9naSramD2MfxuNMgsfxj
         2JrpUjNIjxbSEhvrLf45bp92c8vIgivDE1G3pq2VRUPJKMfWjmOSDxwzdRWbd8uiBhO/
         /AUa3l/KR6c53crHu3AC7XDIkyt/Fj2uf6fK0Tx7XTocjw2yY8eHv6rqRkxBC/W8wRmb
         QyfA==
X-Forwarded-Encrypted: i=1; AKwUvByn5jT9R7GIfKQin6D0ox6E9/LMPO5k4ln18R0rP/RrSctZN4ddQmXYG92PSdqSGtCcKhtigdKqjuDU@vger.kernel.org
X-Gm-Message-State: AFq9FYLx5wGib3XleuOqaUH5dc+6uMytbq1CdiT+JeawQzSeP9t3Vq/p
	Vn97l45LrKrVPEzgaPBUbYGBcZJoAjq9lV243CoJsBSVzv9J84nAsz3eYi9bHFe0/Rvq3iBM6Uq
	uaHzaAXxLVKuE/m2N3UiqsrxpGlQStwmhJQ/H9xQljRLrUsv0pUhFCpkfaf+Nrvh7
X-Gm-Gg: AYBFou1fo8HPS9yqg5fagib15CMkWYh8QaWtqv0xhYhPeN4MpKRGkZgZJ/rP1tjoocM
	kAMg6TsUHWUYfb6CpEHy2wWjE+wATcyyHlMRr6NC+AIrf5MxxRpnUvIHOCIyOhSLDRsfjEDcsGw
	yItfb0uh82otH3zmaic74UvmNji/CiC4/PNoC6R5OmGsbtL1UYX++vRK3DkyNMtdL+TU1MWNG8i
	V7eWGk8xN1jTT8VuOaL0ixh0GYuS4QqKfkNyXJZWA9h+3c8ThbdTAWXhZ+7BIu+Kh4Qub7zHT7o
	pGAH5vLQKUvMdqM/bS4SrrVX87Ih+OAgXtJj18UIIWLbvGC4GxnCaod6UUlWuHnfwulmmSSLb3p
	6YI2gtp+ZP6X3Db7GVAqb+0jDkgOOboKgr4655p6K3SnaVYTqFaxC9z7GSTf4F4DXhSB2d1v2Db
	QSwn8XfiBR1nAo
X-Received: by 2002:a05:620a:4411:b0:93e:7ec5:2d65 with SMTP id af79cd13be357-93ebd20b8f0mr3005238785a.31.1792054739239;
        Thu, 15 Oct 2026 01:58:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:93e:7ec5:2d65 with SMTP id af79cd13be357-93ebd20b8f0mr3005234985a.31.1792054738671;
        Thu, 15 Oct 2026 01:58:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:41 +0300
Subject: [PATCH 4/9] dt-bindings: mfd: qcom,spmi-pmic: add LCDB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-4-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CinbcOsRrU+weX/x8DlHfWVx496vQyqNGyiZd765C8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXEzPl3ITzxisJqsyw4t0pMlSYPsdLWHMBT5
 voOcnO3kOiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxAAKCRCLPIo+Aiko
 1eF5B/9YLyJIm841SYHHx7rwcbc4xMrNlKQYxSlfc3LF159sdBscm4twCToMomUy2BcBEVMFUtC
 mdoa1ukOkMfZz5w/HKjj1PmtFbnLx/D3Bu93+giW3zgS6l2EwH+qUkGwFJLvkq9SFQ38TlRm455
 0Y/gSXgT19PSELm2mrxTbo+uaxIfBzJyygKhU9NiJpiCAzWLItkY3dSyIgc/joHWGNyfQatevW0
 w7F9C7B5MM/1cl9cVnPq+OHUZA53YXzXZN0Hnut1G2pCe/7ffN+9sSQvhddiU3EJEp9EfiNxeu6
 jb30K+1QwSzPiVqd3KR10oY9QwWmyp9OaUlg5gsPtE1jqJl2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: J2fN5agBEy2bG4jibC08RscRUAbFWZkg
X-Proofpoint-ORIG-GUID: J2fN5agBEy2bG4jibC08RscRUAbFWZkg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX89vLqTnuhQ9F
 vUOhu0kAP8nlpdb5orqsbXn46QCrotIhnFTlpXI7eROY3E19RQi+D/ARGgXIGywDpq+L/HztL4i
 /Zu5UvTBQ6b89LXwmt2XNwKS8bS29pg=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad095d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=l4xqpnzKx15mTiSKZogA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX8fRl7e4AT/c1
 oHKEbtfYxBIcc6cMp3ZK5QwSg7ggcZT6dKQhI3Zhm4cxjiBkMVQLlGE2WTbs4drrVX8M7iKcJfM
 q/N+8gFyDnTfD1M4RNZzH4EkX9EocJGPls3Cxdws0ULpSihBPhDZt7WgP2mNEINrepuVqNIh2oH
 AD8W4eP5lwJaKn3KNRI1g2CP2L4tCNFanMQJ9K5K+DR9QDzp1kWMj/qE883LhMX+S/i/ls2SBMZ
 u7S4ltysxMuysg+Q4HhozghMUKbQCEKn/G5T4wDFoznxOJ9jNUIGyFZ9su4HbVEhhrJoo7LOEAz
 MK6dFlwtCz+O1Y95qy1VlGG11dkYMYDhsPO+vHuQEX/utJrxN2tQK8wznbtXECOec1rDHuOtl6H
 BygAnOFlLeCHj+1HOItXD2I08f+CQObCCgULJhJXKTSciHQfNK8ksmKWkqsqg9Gnb3vQskglM9o
 wowZc+yO1kvxLdRwzbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

Allow the LCDB regulator block as a child of the SPMI PMIC node.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..1894fd82cbda 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -171,6 +171,10 @@ patternProperties:
     type: object
     $ref: /schemas/input/qcom,spmi-haptics.yaml#
 
+  "^lcdb@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/regulator/qcom,pm8150l-lcdb.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.47.3

