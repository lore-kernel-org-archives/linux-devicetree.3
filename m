Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F34B2033
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622172; cv=none; b=ZYItTvrPm+eVz4RgxlSOQeFP4d5uZoVMCgsr2gFB4Lg8pRIruv319YfW524YVAlJaLcgzptl8xwqfl5wL92dm5YKNICY0fcGdxiP8quTMBvcrIoOPGiACn1iigXllBlalBZ5bg12sD1mbdYfyWtUl5T8wLsb0l+r4FDd7aKEmro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622172; c=relaxed/simple;
	bh=Uyo7hXJaEAF1gH4XY+cmoRAczUbVpxvWUGMccuon35U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pV2T4kPX+vB9IhOqZ8bmlQpQ46oR5F4sdBrU5RGwDUss5SXedLWREyBaF94QEEnX8giHahvHlrlnVLfPNxFwlT3GerUml/+78F81YRtUoF0LboczcT//opLLMXEwdCMW9iF6jDbobI37VwQ63crEio/NbBZCwGwzIGt59uR9+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuzICB/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixTgFntG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuzICB/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixTgFntG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685EiHre2629501
	for <devicetree@vger.kernel.org>; Sat, 5 Sep 2026 15:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=; b=TuzICB/wAXrp8Auc
	kwsrO/t2aw8fVvtUQ0z9ewxvcdYOx7mwlTxf6BT4wy6hFLCGEldJVOpZ7cvSlcGz
	WTfhOiGXYpRlaFwh5yJe0E5cBK4WUBTQEKLITfLV0AgL7SMiN3MchU2nKuLKezkX
	lopDAHhDBrHKdh2hpjVn6aO027Jledi+sACKgWu2EgJ5EDrGChJ6tSQtvlcsqZty
	bDPnWCmnD3SyFNq3eDhoTahU+BApQBXZ8C7bxHXF15FB27hQ8Rh5gAFWhzVIIOJS
	xufNEkGCIz2chRcNV7uEA1wRAITPwLAT3xhJV2p3nJJvWaUQzflRJND9HhD3aGHG
	hmKKlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq1xxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 15:29:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so23780725ad.3
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 08:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622166; x=1789226966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=;
        b=ixTgFntGWQwRQAHzjzSoJgsMxql/2cZsARX2S/IOtfZYWKbfQFh7+PpkgykrUOiFME
         y+hn5JMoH6Pz+qO4LDniqt0LKbhON8oha/teaDS7FGbg9R1wGMfdp23HN2xYMAMdmbT7
         0yPEfclSFSHBoxIBCm98Aapy/HD/ncBvXNvngE5i3R1/ej0dicUNpQ5f92ytYtM1Jd3u
         vVfGLX4UsyaeaDSnXmI6tZg8Ay/CUQcMdS4yOwus/ENUMUIMn9Vv+UdpJSWk4//2EN6z
         JkiQozG3fnNP2aUG68L+yG2tmddndxHl04jaBdMqmXpz8F8qjIh3cvUGocpTDmQEoXEp
         5NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622166; x=1789226966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=;
        b=N15dXhzSZllDgxlz5j3MUDq/wyt9xlfhPO1GLvEg9ztGYL3W3Hmenfs1vwmap0wgfv
         DIUHQYKzVFOK3+VXf+av0FD8HZJa25WKuPFzBD0R5yb/XyY5XN5FtajfhQwEgvblgXGs
         irFms+zTXPXS814PIND+yDPybdJb+6HaDC8qwH9V3Ps/SIskvjT2km27VFm1kj27IIiU
         blHE02E99miyfyekFXPe6ibUrv18W/l9nJVE42XzYLTTpcKsA154WeRQLTgBqgAxP9IY
         XF+6nN5OmL2VBoHqsuH+DqLgc/SeXYBpZDsn29LT07URKhzP8I7RtqtQMK/Jaqg7GLFI
         /DfQ==
X-Forwarded-Encrypted: i=1; AKwUvByLULUrphxJMDTK9S4FSJcY/W21EVXXDlyAtepWw0+ut0oiPeJkoAdJraRF6gfiw7xDWaOqsN+MSFuB@vger.kernel.org
X-Gm-Message-State: AFuF++lrwDPmUSkxt7/45csPVxAsBP2NciKNIcnc93NELecIpQ8Z0+uk
	QWhFpNtVST58iQbl1U5k/3J50py1aFln/dIJBDx9UEx3ZaQyj12V7YRRFJMkQDDMB/gh8jEKOVv
	Q62bZc1LU2JCOUyQzY7/QxlVV5q7psOrRRWp7SG3bpyZCXs647Cd+TBcl+bqvyRgU
X-Gm-Gg: AYBFou2z/BLKUmElTvL3ta1B/bujJNSyjcwu4KIKfaMUKijF42hYgQ+f7qUD/EUvvhv
	UobPgFAk85BZ5IkY8LEkkQ4Xi3rV8L6RVNH2GRK+x9IH8hQMNbHmpl2KvRt25SJLUqhRn+/Ky7D
	SUio/qIyANOA6kfjD1YfaEkKaEJIQBlUX+12Sqi0IVWEj4WvVVroK3WsGSqTJIv7QrHVEs4Mqdg
	n/vybSC8avpvK47Br4KHAohFlbEF/SB0RG9T4cEQWVbx2+emTyoaWjrkeQ0COS1e7tRozhcEeR5
	J+rSjCQfFCTz3MgA1Ki7a5QxSc3rKSZcImPbWKjpK3zK7TO9nqlzT2hSUgZ0XvZb26Z1weTI/Nh
	JvYB0jW97z2ItkH5mnkp6MCFn3GOPGIEOxx+nBpUwlVpmkLC0ta794jFmVeu54cIlA5DClQ==
X-Received: by 2002:a17:902:ce89:b0:2da:e967:7953 with SMTP id d9443c01a7336-2db125f1626mr175066065ad.12.1788622166541;
        Sat, 05 Sep 2026 08:29:26 -0700 (PDT)
X-Received: by 2002:a17:902:ce89:b0:2da:e967:7953 with SMTP id d9443c01a7336-2db125f1626mr175065495ad.12.1788622166057;
        Sat, 05 Sep 2026 08:29:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:06 +0530
Subject: [PATCH v7 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-2-820cf5377a70@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=2281;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Uyo7hXJaEAF1gH4XY+cmoRAczUbVpxvWUGMccuon35U=;
 b=5QchFc35Jg6+fBq4P788nJWtG3L3Yo+D9VMtZnp/+4UXnmsYyJtl1KAulTFo3ukVADJW8/zVL
 EO9jE2yBSFXAqy2xcHlyjnIwE1iH+gBwcfKMLdKiiGKeMp3F+K8ENgt
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9c3557 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=YrurubeZKOWHlXb_luAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX1ACkU9erbaDp
 OJ05E4YQ3R5VBk3HqlSDyuFoKc11nMv0xzQ8Xn477LbAKtxknwbAt64A6L+8IO8zbiW3z2RklD2
 kOExWfayd9aehB6Ry8URgx9dVPkvpEc=
X-Proofpoint-ORIG-GUID: Pjky0rH7Yj0_4Pri9_G_ebKVA25dfCHz
X-Proofpoint-GUID: Pjky0rH7Yj0_4Pri9_G_ebKVA25dfCHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX0jPHaLYg0zpD
 Z/qb02TBMAIqRWPfixj+ut0P2OLl6hFJr7ANYCf5EJpgWikFkYmhdPd5mANomAWOS1txsehW7n2
 CsUdkQ4yLZV0g6mRB7OBeKfO7rLEdJkWJWreRcHNXu4iUTCY6rrJ6tWN8WwuoEV9ifYaOfaykMH
 BGXbWIYFR1uv65Y2Lap2HsNsaTLly8YKIcMgpXx1zGk76hKbB89JeQQ2KcPasAjTfPIQ1vbQTIu
 tw2kLUIBuWwC9NT4HGsreybYi46ybuPvJHMeegRkN11S3lpDUmjhptFzikkS8nt4ac1CVVpfZ9r
 +7/mT9/a0hkRbEgvJzB7z/q/GcUf0/0xd0yn7odtytALPX6A5EbPHzebsdEmJPNVGepRR9TFreJ
 4i8409/NCYzkTGR2NcISC4icCdjHmReBwAotcE1HGOrNyJMHTKsHWPulMopv+CYPwk4/Sr5I4/3
 n+0RqoNkLL4sB+hiZGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050170

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode) because
DP and DM interrupt lines need to be configured differently for each of
them.

Add support to cache the PHY_TYPE and add the following helpers:

- phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

- phy_get_type() for the consumers (like USB controllers) to query the
type of phy connected to them.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..038c2b58bbe1 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -21,6 +21,8 @@
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
+#include <dt-bindings/phy/phy.h>
+
 struct phy;
 
 enum phy_mode {
@@ -152,11 +154,13 @@ struct phy_ops {
  * @bus_width: Data path width implemented by PHY
  * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
  * @mode: PHY mode
+ * @type: PHY type
  */
 struct phy_attrs {
 	u32			bus_width;
 	u32			max_link_rate;
 	enum phy_mode		mode;
+	int			type;
 };
 
 /**
@@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 {
 	return phy->attrs.mode;
 }
+
+static inline int phy_get_type(struct phy *phy)
+{
+	if (phy)
+		return phy->attrs.type;
+
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+	phy->attrs.type = type;
+}
+
 int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
@@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 	return PHY_MODE_INVALID;
 }
 
+static inline int phy_get_type(struct phy *phy)
+{
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+}
+
 static inline int phy_reset(struct phy *phy)
 {
 	if (!phy)

-- 
2.34.1

