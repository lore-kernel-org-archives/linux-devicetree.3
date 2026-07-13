Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EFF417361
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948125; cv=none; b=V8Kv4c6wFQJTJCwuXGJ1deSl/W5DFqwFofvqtRpMM/dQZ5CDWKX8cTfXOwUwyHvI8vLfwXos1GNO6z3Bccd3dN6lBwV4ssKu0c5k7mfWrOq6BILJB0TX3Sbm6KLxamYhYtSgi3gmfpazRQRDON3gsHO59d2vw7g7BclucoEVC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948125; c=relaxed/simple;
	bh=3WLtHMYOWWG6YJSbPwoPg6vHqdpiCE8i5VjgYuBraF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYz28++o4bJ11Vb5lwGpaxjB8PpRN6UyabdmyRkWLtHR20o2iHiWnDoYrF2kxBk4wtt4bZQKqYqehgbnDw/seA7IKWGf8vFARX+0FSPU/I7tkl+ZbEU3y2qHvOT9kT77rHQwJtJdjbA3Iqk6vVHbjE7gz+DyRLuBkgInvkeDys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwZFOz/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZNqyfBK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwZFOz/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZNqyfBK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDaFh1299326
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r57t4avPqTzhJ2J5sOt/oWIGHq+WEOhtA2WuO2ZZaEg=; b=gwZFOz/RpWmq45YI
	n002hxuwWBCp7DJ4Li0RyiQcPNE3xnW27pM+kCRMYbjRdk/IbPU8shO4YWEYJ/I6
	yfa47fsXh4GmouaIZzgBWd/Zicrs4xR+x/AKOvxGD6XfEp95PY7pTVXShMQOTUPT
	m7NWntl1eOBB2CdgezL7Q9X5dI5D4NDDiaJP0fV6v2u9mal+XViqFWsvXRKnhIjQ
	phuunprbAVpUWmsU0cV2hWqzpJlpUYNnnMOXSL2sldmTLY5T0zzuB//i6/4cu5li
	z+yiLrZMhLzDPHeVE9ErXo1kZ+HyT7PRZSKP65bmDSPauP24qJa10WXPbbCHi38/
	v4w70Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gr5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:43 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a37fb394f3so2288897eaf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948123; x=1784552923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r57t4avPqTzhJ2J5sOt/oWIGHq+WEOhtA2WuO2ZZaEg=;
        b=CZNqyfBKbZAAJEevdkCTsP0q+PDaqeO7iAheoS5AlC8G4Wkqv+18dKvEr0H/APqxas
         p7ePlbJ6poA0b27JRTx7zCrsmnVdEwfuaPZnwRdwP7C5hFn9oiy9zevUIkJe9tPXHnwb
         0PhGAd+Q6kk5QA5USCknVaQMs/zw/gFrntp3HDAiC60FU1+nmy6q0GpYPJWrMNe5+2Fm
         B0gD1lIXOD/wGeDm9kAqX8zyqEyVDyeCXvL0oF6OTAxNJna9iO2vEjh1aqrkFX8Kckfa
         Ja+oBsHnwRGlXT8Om9JwqjIlG4LNtvkBozCv+/Lv3CK2O1G0b+5AG+xZXdme2e9KEKPZ
         rmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948123; x=1784552923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r57t4avPqTzhJ2J5sOt/oWIGHq+WEOhtA2WuO2ZZaEg=;
        b=JWykNvOh+FC9VN4etC6b4SDVKcRvRwWCIYZVOl9MLTjNDoZQj3vnaK66/CHKBf1SWy
         U8Uqw9hXrf90ooGub4u/uLzIV6Pi2Elwzmqd6Cl/z4IyeiZ5c4RojX06zs4Dc9YS8Q7a
         q7+8eBFmLPnIkaHIFVv8KKRk5tKcGkGhk+YesBIXPLPdVFyotWumk5Li6VQzU7zPIjOF
         iUkyOfFRNYq0EORt9ZyIREwWIcUt9LK4cSoAjSAQ21hcBe3x7zLt/+d1WfGqJKHblDbA
         ywFuSLdzdL2y86ASOI0AZQtEfTK09v5SBksYolteTqnYN3GiBSLuzZM774oVskvongeW
         bQQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SwO1IwhzJPkPICTZtSMZmHP6K6fEaEHrCkPwKl23WQ+nPj0Ky2DX0c46UEygf1q5PER+ugltXx/SK@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7ZKTnO3JtkTdisPk6FCDrfUU8ILK2Y8Uj/78CfAgkYoT4z5J
	ltkBnWtAwi3fOk+ZP2Xw7peIpWpvssjazR/SoduERQGHi489f3V4fZiUfsjB+KbE9AOrmmnDSab
	aD0dF1KU0wpXCslv1XMB0pi9lijxHeUt77eKC3PEHap8DcIMFKFyeMl/lvhlp7Y00
X-Gm-Gg: AfdE7cni8w8IhNXg+hW6zz+DQUFA3hit5cFbGFbcTQkbzz6NcZXofgX6j7d8s/GDk2E
	TNomtOU60ajkRPQ3iQ2oBy0f7xiE3qtY0rfw3YIF8B+GMEyacJJ3U21Xl3yHzFlyXBlcZoOewdQ
	zbvVc35rDhDHbq9ec++E+Mc8LZ6htFlFk3ehxqdHT7iMHZV+XTDsjVYeh/Bz2i7wkARcyniW2X/
	qCRGxSB0GzxPyQG423F12susmJ7eFPo8+sxRMzwOnRx8b3ccwRSNCToF+p9LjX1K0ahMW2GAWiS
	d6pa8ArlEfietHnD/7iUgD/l86E1F8nWWPiOUpFuGSLJEfJ9iu2bwcAmGMWgDQyfT/vbxB2edON
	Twyj+ATOTacKSEEwOIVYEP29xIUtBGCNRSTOKxUJqsR6/KuPwaINe22VePv7lhcpxKyCtSwmb4k
	jywJuX
X-Received: by 2002:a05:6820:c81:b0:6a3:8023:af0a with SMTP id 006d021491bc7-6a39a630e13mr5348701eaf.31.1783948123121;
        Mon, 13 Jul 2026 06:08:43 -0700 (PDT)
X-Received: by 2002:a05:6820:c81:b0:6a3:8023:af0a with SMTP id 006d021491bc7-6a39a630e13mr5348685eaf.31.1783948122655;
        Mon, 13 Jul 2026 06:08:42 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e16c7d8sm6415913eaf.9.2026.07.13.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:08:42 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:38:28 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili-usb-phy-v1-1-3285da11f148@oss.qualcomm.com>
References: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
In-Reply-To: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783948113; l=982;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=3WLtHMYOWWG6YJSbPwoPg6vHqdpiCE8i5VjgYuBraF4=;
 b=TnPiNtyvARISbs9UcMFxGz78vo1eN613ZxZL+NYqdlHqEpXjNnL8Fzw6roTJ16R6a4KJTpIfi
 a69noB7eTmgAMFb0u6JlFiz1hPunaTg8cetE+vTI75h+V1RVos+WX2/
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: wYDhMT0NZhusuKeJBDBXmLO5Oi_rBs8z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX17sY3OJRg8GD
 Pmtaj/r6FgJZIq4FL9wLroa1f/OXiMNKjunso5R6muDptMEohcXKyG5xoQBByYc7M6sGRvs4Kxr
 qsBtoxV4AQLWR8ZCLfWDQFNPFooKL+M=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54e35b cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LtwHUEFrW3c5eyPZFKUA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX1SF5cf15dyWO
 4G5j8RHBmA8CCaDengwtgwRlxGwjvr1ZSFmYYNaOShqD0pfRT2s0mIs/KdaVhuyaiRQO6vwbau4
 MWAwBYFEgJtfnaQWs1c1UL6YMPqX7t3mwtd5aO3Xgwza8lJjg6DunvRjaYQc3lGCAOw3cnuXTKF
 Wom3+1Tr1nE/zwr1mdTPBPPVY5Or5umcjCwt0WyY4Vxh5abnwl4XFeZMpxsKHESkBoAv1nB4E2l
 r6jAW4pzt0OSVHTVqFppCvKFX4ky9Ju5FzJEvjtcl/2NwCyAJFk0lZQLoWU1YdOJ8ph1lr8yvPi
 hWnlSGeE+0yOHHpZJbdCrwASzV2Dyd3NnShEa0m2M4o5nM9rJnUUa6egb5LnGyu2w3tIcjCtI28
 2gOi974zO6/xFqt6iPm1YZKuBp/NpbiaHLMH8cVFD7KkZPd6ikmj9RO5POAlSPR9K6SLYj3Gg8C
 9kEgd3DImf00611szUA==
X-Proofpoint-GUID: wYDhMT0NZhusuKeJBDBXmLO5Oi_rBs8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130137

Document the M31 eUSB2 PHY for Maili which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on Maili
with that on the SM8750.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c0e7e2963ce6..613fa5cfe9a7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-m31-eusb2-phy
               - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
+              - qcom,maili-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
 

-- 
2.34.1

