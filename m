Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AB148821C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390186; cv=none; b=kjZ9yQniPBqCz0+OY6wvdSlFQIbIHhxI7MIq5vQF8DTV8NfspgmOpiMC0Yz9soKfOVlVO3auKBFLfQuhEuKhD9usuI2JkXX9y03NCy2m3mM0O1AsnmzdGLWJDdfpHy9fK7sqwu8tBRuGrMm+a2wL4336EYi8sQjgPz0YxrYWm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390186; c=relaxed/simple;
	bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+Wpr1tJH3chT65U687+IIJuUk076J3WTPPGYO9PpuyEqOyrN4Ujxj5Xr4FM2bJQCr/quVQ3crWfvzfZetaGTSuJ85XgmDZpK2nDHvOTDJGsASO3rG1GX+o1Nd/jXqd2E1bNwJ7XUjBnVmwELQm7FcR2u6iJsNXId7aPFIFTQRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDaShxoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNrRTCDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDaShxoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNrRTCDu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmAOi377900
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=; b=lDaShxoEBJVT3/Z3
	Rqe6PiifZ5pkg24csy3U1Lc7JW2D8/P1Wztn+SffJif8FXTs6zFqiUSPM2CBby1w
	k+dKX9EPBB1H4UvKNPc7XCQ5clDp8FADbVxMbjrRn6gH8pulkhEUBcTkA7Kh3+zQ
	naIhxl5SRCq+doaaZk3swJKLBfCBd9QKD/gOmveRBnTLrdQ4dl7ZClzAVh68k59S
	61XEuylHUW6IwW5n+ig0C/+CIKxwW8q/gFEf+AdKNQsbwGjt7GJ5XqFkdwz+P9TT
	A44cWJPcTSpN/q6NXJ72a2mhywXCwHD/oECN1WPU+7p/ximpWHoCMuDgtm7hq5K1
	Sr8LjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8qh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so499672785a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390181; x=1789994981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=GNrRTCDu8OanY5/HX2c3UWdmCrgol95JsbBzMQElCEeZeUVUuxDEkSACtcIjXdeTdD
         KDj6EE9LN37Kwq0qXety0m2eWQPs3tSwSsM2dRNFKXSktmw1BQbDSZcVBLQY8PY5C3H2
         G7eBHei4JZ9k7RIRtUmYGQkytkYmhoYAckCKGDCFSdaPHbsaqleJxJ79lNZ6ESkeL9wd
         LmyKy6dlbpXjz5DaTAcNtnWBZWUZKfVYn84Krdy2A0JYDt+6Tt62ztjDUqL6+w9jNr+E
         zPcQtYsyyNTRVVjWtM6Ep760Wx9pFPsXFb3OdgSZecegh8JARdsCyg+vx7NP0pdQOLaN
         SUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390181; x=1789994981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaQDj8IK5FlNVRz3fBTcniF5ZIYoAPkZqKgLTw2UT1Y=;
        b=WVyUp7d6h/39d8Ehpzxq63LCDgMddVi2UTl6//sHpgP0qFrZK2k5m8ivCaVu+eDFtH
         ivsv4IDfZqMhvk+PxV/B7teZRRFSgwg0VdDaTBh276ChuoCVeqc79DlX3BLAKUzJIA8v
         6JRL2AzX4zHEALajtr2BPBuE2YyW1adKT2igazyh3VYnhR94oXWdUFnzArI1py4YPP3T
         xLmgA977Yo9mXa0stUvtyUUVTWHapQU4Btv3MQHflEh4ewGZEH032KZwkOW3JSwB+7Zs
         V0Cg2Py9XH3/6sK49d28Z4IwMpla0AvQddel75dUToMxUYD0U6pU5btll+2gcdoSIoWN
         e83w==
X-Forwarded-Encrypted: i=1; AKwUvBye/omEv3uSZcO1FVehFz7eDvKoXJKBwCUdwqiwjygPZpb0GZAg6PLgRA0clbZgJ0grg+p+reM/xyCy@vger.kernel.org
X-Gm-Message-State: AFuF++mrlR7tC3zzxdAuqnhkMf/H7RRd/hgGmsXl+fJ30waLEILxgdyl
	6YvUG4xqHA6v0xXPx3SYdU8axXUm/rj2VpUWnxtXJ3SsVlYo5NS8nYodjc4Ol/Rd5xjq/j9A5xD
	XX08jLPnnTvssrftaTUH3NrBrCfV4Ioj0n3HNQCwu6NsV8P9NDxCf4NH6R7a/4zBP
X-Gm-Gg: AYBFou2bYOQDcjzEICgGH6b8pokfyRF7b0vka+i2nw5bVuqKTKq5Ly0ezmMDUcx88IG
	skH23Z7CboUJuBK8nWUSHGypxl6Q4kfTBKX7fsqjtRAoiz3g9dutVGR7WTYFdpRukjZFg0VL2fL
	bq4EdedNGuhm7h/xIXk7M6OyjmB9Nwgzx5H/gaEtPzfELbtvZ6WBnGZJ77IoFtF77JFAs1Keiwj
	NVzYy5EoqMZFsI/O+zL5thvVmhBofbV+9DGHqYp1a4vckwi6nlIn2cMnNiCz6hzXAN2nzagi5d9
	wTJCX/Ptnom32EoGslPEeSQrrLIbdGZCKylDkN7irOZtJGtc7CA7HJtamvbm4eCRJIsXQnSx7VZ
	LGiqz81Ui
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr366175685a.18.1789390181100;
        Mon, 14 Sep 2026 05:49:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:939:9fca:8d2 with SMTP id af79cd13be357-93a2981322bmr366167685a.18.1789390180464;
        Mon, 14 Sep 2026 05:49:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:36 +0300
Subject: [PATCH v4 37/52] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-37-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQHDVatt72dxAqTGiEP/fVb8h6kq5JRi5hP7B73zVGs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zv4/eFW1FaopVgDUJQnp0OgwORb0ycN42cz
 S5mNGPoVSmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs7wAKCRAbX0TJAJUV
 VjU3EACmDWvnk10Eo+H+mpt/O611ky3FFY1ZKuY6ck/5cx1nrH38gXUNnMUw6WBaUHbFUzv0kwx
 eM3wMGx8JdsqA2DI56akEs1qFPnmNtLawv4RvM0qNS5SD3iXJqGqLviUZvXZxxTY5ks8grKePHz
 H/bWp9TU9HM3lRy/mEBDovspamc4Fa780JH46WcgFRogAA1BZmoKrm4wfyb2DRgEDUWTFp4d61E
 Fe4nBEJr8qPfXf5kv1/ZtmDPYos9N537YjwXa+AnvPQ+WfKzlwh8AhC9PParyJGKa70jeo6q+1u
 UAmjWRyVzj99iTnD82fIwDsiwo20j3qZobBXir1Oq0xQ0MoNpmUc/IsB4n/NqRbzGdYtiUIpaTz
 e4MYO92TGRZwWmEgCxOGPRle+5iJK2q1ZTT+VOnxDMp0Ll1iwm8OncwVbF8F1u1bBBq0t3npEZi
 yIKoW2uxTqT3oVDgPtnwYn1L2w01LagqCQAfpKz5Ul+Bz6OL2Locf3DtNPSujqRhPMwbnXdX+YX
 Bdp15hyolgBI0RZ4PC7/Rp4y1X7LP9yvW2QHeJLYuMql5ZsGLAvZPMvu+34hxn49matq5Bwp9Ag
 IuiiqCfVWI61867WzmUdDKRp7hGeg8bhz7rmgHb0BL8LbOji8iPBwLLYJQj1dxarKYn//n22Ck0
 yImIZ5fLfFxUlUg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX8blJRh+wXmSI
 7PrrHTpgcxxTwWCxryiUkrO+80seJ4owSJL2o5A59tBAxjjKlSWz9asRNABPXGh7Vy+FgS7tYfo
 3HbEU94vBH+Zzz3Ej46Y82sm6shFSYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+Fnm5QF2CJJ5
 XKCFvvObzryW+Bp9axJaE3GIxcLc04jgzFnMgKiXiZc2AKKp32Vryq9xXTtuFBpbQWGCCg9pSoV
 DBkF5ckIL/kFEmoY6gTymGZPtOhykxmV/1YhGoKcTNyo+kOkKJLw5D3bbtpIVbpdwarwdUQb38V
 YPg9yA3FapmOvOTZ+Ziwr7N0pIFc+cwAoVNT0r8+Zr1hO8mdFT85SHL22Fqy0QTWaDWg6sZxUZs
 H8jZuv7qd7Nc2CUS/59vyZLrnfPl9GCoBfaPGb5jGtZuEBon2DPyzFNp/kigaXLmnd9QFP/RQSM
 /Ub98UUYEl+uLlyPHfKZxbBHQhKixnFaPmXMJ7iJrvwHWG7Y857OqBS9T/k7yIA7iqhdAo1bTYC
 IFxOQGtREZN6aBieJiFtWXb7+ZGQbYB+Zlucb7X8RtpRPxlKKeJLAKIO6gak5R/Hk88W4QjIhdr
 hg/n32Y8vhi4IWGnyDA==
X-Proofpoint-GUID: AnKtgjqVG7nlWArnPxE2Cf6EZH5gCmEF
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ed66 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3K_yQeBcBf-sZL04j2EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: AnKtgjqVG7nlWArnPxE2Cf6EZH5gCmEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..c1528cc8b7b3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -552,6 +552,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

