Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F147B413
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390113; cv=none; b=BGTM/b5HXLrwIMimMQ4zPTfZaLIjpKJU6KSR8FgWkFHzYwS457Nmu+uM1b94obEM+yJVHqr/wY63WB1dEuGQZFonar84Zjdch3T1V/fqiazdEb+GMPQke8HdTMBBjt/u3kmjmRJLclZ6foy7dBIWuZfwUZB8qLfTVBW3GOQj+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390113; c=relaxed/simple;
	bh=XCZH8vhB2VqAgFOo+HO9pBpLZBnXr1kzRRdbw/lyKII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUYCNyNIcjYSF2VQ4H/CfCRAasHCP50LOni7JcA2e03jPeELga046O1sF0/BBx1MyphkuunyMNg19SPgu9VQBS0aWNywrMbhR2Xkf2kDI0PV9o/sgVOQKEHUw39MeXH+m7RR2p3kANeE5hinMu5v/MCVJTd/tjBu1XAHwCY6Mag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCikKDuu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARXN/3AY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCikKDuu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARXN/3AY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm34S728468
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhr5wZyqoRDadrIxLws78Oqy3KLTVlUXwdSwqb6H0iE=; b=PCikKDuuUuZ+PqWG
	vv6htoSxQhItiCTvHkDrZIhDYwRDeL4OZuv6A/hlz88jY7d1vNMFoVgezZDGkdl7
	mfMJhNyOJjF7ATVRHuXwIO3OyJoablCMejFTCm0FMY/7I8yLqagMND5TN9wRpdhK
	W8eBZ1BZN9no/ZGH1TP3f9bIRPUcfjH2ZXecfj66S7zqi6LHRYyfFi55byZtIwt6
	yjSvSQaOAu3Y5WVA3vlMQkHtXst+0eA3qZ1qToIlJHyp2wQMp7LO/ByIYfwbrZEI
	EpAWErTYa77Da3ghiUqpNZRyOkh6oLaXyFE8XfapdlS2ECIETomxS+7PeG7k1WqZ
	/CD36w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5ry01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so601386685a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390110; x=1789994910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhr5wZyqoRDadrIxLws78Oqy3KLTVlUXwdSwqb6H0iE=;
        b=ARXN/3AYC/761Iw6rPsC0AxQQrr1lD9OUqJ2FMi1le/M8MYBrSreL9mZ8cqH8uVN9f
         Ry7Lfzw5nsAsxWGQFrVkY+9dA/wNzEt+QBNQQFKwHi9g9dSXUA7WuZgNLg9MNLj+e6Mx
         DJJkCgNhMXDgUf3UwB8ufjs5g+uRtj+7goCmWxp5zusYkz0oE9KK0kOMt8xOYPpmpL/T
         FoPBys69wtWzb00Mwrn7i0Bb6R4zT3/8SJu1mL/wHmOpeDht1G3Re7WFjhiKyJfpl6eT
         n0+4qS8Sc3YVuM3IJoAMq4tnN7bxjhW5F7zaGj5M/KAl7qGScIwIO/lNt6Fp1oeZIe1T
         VyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390110; x=1789994910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhr5wZyqoRDadrIxLws78Oqy3KLTVlUXwdSwqb6H0iE=;
        b=iW5Oxom7Nevr1ynPPpvAIYsrSjfxN7AXM5hdaN7WxJGn0LbMljH/TC7f3EkcJBuF6b
         0QoxBnHvJWcBBfyXTpq89CEi8ksu5c6SPdSRT8UfHwV3oVq8HQjJhlMHQM4XQAvcXQW0
         gZjZkCRmcFPuUtfX20oLDpL96sQlPTgAYXHrXpUx7XHYUHT6MVfFeBNf2WnGXp8FuKo5
         wNyoY18VLeIIoRgQVcfelXgCjUDpwGHBmO8PiLik/uswq34rlNfVBbrJCBSUqxatlkOo
         j371XMxR0qH/U5dDf3Hd4kVpV4j4EAYOfa5QrfgwelSWs8Kw7GXNETgh5M1F36+bVdZV
         /2UA==
X-Forwarded-Encrypted: i=1; AKwUvBw049++WWALyE7hMRmKdLJ0TsqEJquml/39bXbCHTcMp4EQzeORt1uKeUfHBtkN6kwmdUsUp9NblZa+@vger.kernel.org
X-Gm-Message-State: AFuF++mu/+P2zdST9LuI6TmhNJjK5pBghWYF9lJKZ1HMjEKCA2YQ7crN
	SdgK7ZOJRGA7h1eqizHybRg1UkbAeE7cHBChWByTLwON/x+Lx+7WHz8XT2t5vAz+O5XqjDV2qjJ
	PwwddJhTm6wtBJD2J67guB60uKPv2IF+pG+sHWLhdOn+bFgf/f2P6BtV+EVosVqmE
X-Gm-Gg: AYBFou2Ras6xndA7Bs/oh5ckyYEco4xj//YxwH/KY3bopAXkl+AbImJkPNv7iRL307z
	nd8d6jsMJHhyymgLK/BA6jU45U9DmqC5AkqumHqZ8xK4ZOusoCph9HmoX0TSeDLZidcYoYQyjqG
	zds+gF3naV0iY3dYxhKSWJoShRApmcY93MRJ3e5mbE/XhBu0yuNdClz5qQZbdzBa8+itM8s28Tr
	eXfqi7IHZ8kCpOH8CMsJjrzWHun4oG7HQVAH70huzde7aNm45jl1TcKs3nYCQIIRjnMaaLnM8lD
	aVicRt1PkktwhDViMnRAKzcyr3YyKjn9/LWjRgxAvv/6pvAuxlgb+6hCl6BTcTpkT7RwrMCEqrO
	ZDvHTSJ7e
X-Received: by 2002:a05:620a:2b9c:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93a29942509mr323791985a.25.1789390109274;
        Mon, 14 Sep 2026 05:48:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93a29942509mr323783885a.25.1789390108610;
        Mon, 14 Sep 2026 05:48:28 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:09 +0300
Subject: [PATCH v4 10/52] dt-bindings: clock: qcom: sm4450-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-10-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XCZH8vhB2VqAgFOo+HO9pBpLZBnXr1kzRRdbw/lyKII=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zVcvdsJW6EaJgrZmzJn5ejesPlemy9bpE4q
 PCpIFdu3sqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs1QAKCRAbX0TJAJUV
 VkrZEADF5Rw+pixHDP52iFJHw8Q40KfxTLrvP8g9zolCFBa0GxycZgsAUzVHa1eqgTLcykzl9St
 oxtq+fMn6QasBBnQ71xeJCWQWkBHoz29O4dxow4mUGwpb/rSv1Oub9I/wAtEKAGjal2sJSzznNm
 TY71dCj/A4aQiNMRS9ZmeXk+kIbr7LJ/WrkGMmzYpGlbvD69aOPKV5ushNtxoQeczKRU6NcHpz9
 D1dn2zkR4Z4yx+j2QASZ3s163qmjNHTbYRSUP1XTw5st4230brVuRFX9lRHt6//r6s2zYHnBNPu
 +5kZcGW1onX6rqRj0xYpOtoQg1FcVq9dlsBKRuZzWwigR8pvKUWAohoaGdjVz1KNPDrFa/HTeQR
 qWxAdSojE5MWhEfWbCAKTi96f3Zj9VpQhY747EXGh/TLjXSOpUFB+vKbXCV9Brt+uJGudZltez3
 v22FwKKpbCTWS7Lt3IseUGMBEajS+61Tofv03J3Q3GnC2wuetioHSnCb7hzyL/lvrL4xiUDS5D/
 v+8Mt2GoCtNfc9gb1Ozvl4S5h+NW6rKl62XW/VU8iAxlTJ/AZ0MKiY1YanjeybvpM3bvV1tdHDm
 7fo29joQiVrp3Iu4q+OYjvx8V3sM1kXVLJ6eHCmKsjEkpdiH8cqKRgaLZQ+1UmT9kKfLU3M/sgH
 8z1Ny/59H40cZ8w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXwWirnEkoFSuo
 bLuyGOOLeG6LBX34kvwZ/e1U3ayUjtzSw6D9MX1nA6PnpeX7dh6XovtaNbXRhw6NhJnDE0ycwEl
 OJkQf/xSXAlkD/IM93sNhyRQLgG3YZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX4ofYqvjwrKkp
 1nZUWVcXkoXlbknoT0BwpWU2Noo3m2n6gUqTAk/qEjg9GoY+bjZLVxlRR+CKBS3ohmM3AKVXguE
 D1mr1Z5GnAVvt+pL+jbKhycaHQRMXfOjOA7MbRr0uogoqixAcNUFsbRZqYLMZuk8m4a4yDhAy2m
 rAA/hZywexrER59AyPv9nGfctb/FYZHV9zM9XLMgL6dsldOhhMR4l4Spwu5qsrXj3PDlmlgQlAB
 2DBknyW+ZI2zFSJs8aaw0jWqo+Bm1j3JWt3wz0rz7tFKdUocDEDCo7ORruXUtnFO0QWalfMZ5v5
 UmIE4JvC9W1jjt6RMLx5AV9ZsOzEa3qJtQbJ1f4t5nQ3oDXRLBNm91azJrnLhB6ImVN3nzVqdfU
 Kg7kiadd7ChJx53nGyTmB2X1uVeGwtSep8gAwYGkJGxckPP39m8oW7MqpDuZdsKwy3J/cwVbQhN
 7LLIknZ1h2u5WrOOdhA==
X-Proofpoint-GUID: -M7vGfwhn4lE6F7EJ9mSuP8f-BW2Iarr
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7ed1e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8nTHk6HmgCSZk9Niz5oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -M7vGfwhn4lE6F7EJ9mSuP8f-BW2Iarr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the SM4450 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
index 9cfe859bacc9..e143300e7be9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
@@ -29,9 +29,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -42,12 +47,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm4450-gcc";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
                <&ufs_mem_phy 0>, <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>, <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

