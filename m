Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B420470E84
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390104; cv=none; b=NnuxwodvpUQkaZ5sNUazRoKPmyLZ0gPE90aW5wV0dt6Nhk5/dHANl+0JOTScykLhI3TrQGjw+9LjgptM/5tPw4GdSWtEv5Kf1WjcXNvWkVe5u2Hq4PU0ZfktKx7gDru0/w/afiNbWkpkOyVReaLvw1mLfnlAsqiTp84hDBQiHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390104; c=relaxed/simple;
	bh=JgJ2Wl7jzlPIHSp8kUuES5K32znNH/l+fUnBFdwTqGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGv+EdRvWl9bGjuMk9c8hOC6CarMJZfHJzKSGjStoT8ZILDbsohi7Yy0m8V2JvLGJPbjKAQEf6Kby/7jc1UQuVbaelE4AsoKJKvGzILx5NxL0XWiMDDYCSykWAH5TK7fmMeWZgOGESExMiGnPoCvbWkPmr/YuJ0NwAT9tGpxWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXjuKNQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6CbJMuW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXjuKNQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6CbJMuW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwMm3860377
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0v4UR/PVGKSxgKIX2GyxHf89EKqOMPEeK9Od3LnLOo=; b=RXjuKNQJnWT4TCsF
	M7PhVbPPEQ/1A9mqaqZYR9b7BH0mO9mqcpfltIm5PDJJIbPftOJROCBmgjXK0nxE
	bWBrgI0/wtJWqymztyD5KMJXtC7ySxh1F3AV9pIDIP+vHOT1dNeRKP1dE4aqJhkU
	/znC3jdd9INTYDioTfbLU17pwdnV9kM/mmoxeY/30oQkraQhCMf1tOrPMIclbAfX
	in47zSAT2V8hPECFTs21o1wbOk/FI5WE/Fy+28zXG156ggDb3PnSMEqlixNWajuW
	p5YVpJ3e0fWM+LMq3VG9YOXwGeTNc7HZ5QVToG8PjeyxwUlkQK+89TgkWLjo4vZT
	b0dusQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f119w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so601366685a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390101; x=1789994901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0v4UR/PVGKSxgKIX2GyxHf89EKqOMPEeK9Od3LnLOo=;
        b=W6CbJMuWKXj+vz6eIZqsZtaAJWTcy7BccrvhFqFp0Y26saxCgh390cc3sJ+0pCw+8x
         ybjwcSRj1JUx1u9pz1DOYbjDQxTCeS0stAUiy70p4Aq87Xqwl32U66LKPWFUjwMPyxgM
         NhaEAzfOSN4by0lPvK5cE3scOuuev0hwakfc+0ikQJtAVvpOpQenihcJyFriVvb4x796
         Bx/U1FOmXaaZ0v5fOhk0s47wBBXrBpz2YxcMSZzrlpzjUWeBHZ5DtP3ehfW41mbT2A5z
         c9omvZOjWXB9KWuoJaIStL2upOe07tlKV+iwRJYdqDRQkzM+yhjRP3Spb4HJfa8xejrz
         CDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390101; x=1789994901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0v4UR/PVGKSxgKIX2GyxHf89EKqOMPEeK9Od3LnLOo=;
        b=UIO4J4Y7VG9hSLSV8PPhlmnhbv4zeRg6d8us4nieKVZniDzQzYXyOM7BxfZK7sykDI
         NtbA5sOnuUTtbWiV0UFMX59i8m+/TSJ8GU9UwBr0NcugBttHQE3wklqrdthJrghRw/6I
         l23eHOAOEZp+2VCyrfk/EZxgGlcc5CxScdDONO7O091aRJM2/TJvR/HQ8iHFZY3xuoRy
         dv/YjNcL0gg+e4APDF3sWar4uSg10PH49ZZOi6WHLjKlJuia8e03YO3DOf9+cCoeIdL5
         c1bkiEla9QnIiOskfI/S1EvnGYEqWRDpxA1Nfw0NlaggViylH73SfS9XLnJlIsAa2aji
         Z+Gw==
X-Forwarded-Encrypted: i=1; AKwUvBz31ZbuhhMGilWlXfXIKNk1XMi2pwolbF5Abj5JbkEnlOzA+j2bvSElqogGVJndHrgY3gs65vTx5+zk@vger.kernel.org
X-Gm-Message-State: AFuF++ksyDvUHBt4d/tgJylPEbkF04qBH2ZSoMZh+mO+84D8B3ws8spt
	pVexxmIeChgSDt7yvyVexyXo2uPMf79hGtbDitS+qdtO6DKNcYfHzO22/FLMPYN6feNHEzximbk
	iBMjBFBAYD8PmEYMHiMCtcpbfES/tcjLVoDm6l3PxCJGiEwGsLIA7oVZ2ElPqBR1v
X-Gm-Gg: AYBFou2g4uf+/8B7Cou09o+1kSVG4Qwxitf09WPluD07rN4FAra6JKN7o/YdCbWKQK7
	GJ/T04I0JEHsx4N3g0xz3V4J3E9QSf1TnZOORTk7uLujMGFDt/QQ9LjWkCp25gboNN5gKFYi7I8
	4L7ivBBXgmvE2dNljt+IOEYcIOiL237vCtbTWA5nhz40wR2WX8aYLlJLjdLR7unuOnoJfnWC13r
	xfb1CEg27cNPxFKfoQ609wU7sH2GlhDEW2IQbCB+K/8vorYhStOssqycdiZK6vFDGtJTdGMoh6A
	p9azNGkDC/hIOQlB29iJf+S6owEByOCBuQvH6S8b43t3AXpa48XWOyXnzbbX5wkJzD+Gfs09HJa
	nsaTYoPR2
X-Received: by 2002:a05:620a:468c:b0:939:6de9:4cff with SMTP id af79cd13be357-93a29bb830amr288662585a.45.1789390100835;
        Mon, 14 Sep 2026 05:48:20 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:939:6de9:4cff with SMTP id af79cd13be357-93a29bb830amr288658185a.45.1789390100366;
        Mon, 14 Sep 2026 05:48:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:06 +0300
Subject: [PATCH v4 07/52] dt-bindings: clock: qcom: sm8550-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-7-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgJ2Wl7jzlPIHSp8kUuES5K32znNH/l+fUnBFdwTqGA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zSqDpevtnciKIcB8tBzq9yEukQYD/6XXOge
 qpjs7OJvUKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs0gAKCRAbX0TJAJUV
 VntND/96MfgIouranaZDldyBr8QqI0B0gtXhl1kB8idf6cwDlA9LnWHBO25bmgZtNMN8jqjGvHX
 IK+5CvGj8FfS/pJlFY6uenhmdS8BjKI/uBT8Kg8WJtcL9u/+BB3tYORMc38NTub/uUZ2DFNbeAc
 qQ5CaEvH7848yx9LAOxb3uKrKBj6kIIdeInjJq6K6NElh/sKSgzkdpqF5LdJFubXLC+K4XwSMhP
 4Dbuwx5jnRg7eMb2O5ZZ13gROutENrrFrddONT9dYxGsnQXjIxpbiGXtXjPVxPn7j+P+hKSZdvL
 T+Zr9k/K7j9GCUsFDswPa7/ykbzONEBG3DnspFW7xnT9opsN/Ys1rEF706yNXhdNw3GZY4UQJg6
 2PAnTobDwlyRQBjjLZkpjYgDREprgo+xPMZtVe6mqnyy/ebcGO31zp8FjS5R3yRLKL0GiscqDm3
 wpY7K8EXEQOemFqzRFRdWqMdWPuV7/NVlEFVSmjC5g0nPDt1BjQVB9xvrWzmrT1P42S+wydolT/
 GLusdC4/x0t/XBIsiNs0mzeyJN0Eh6DkiVR/O7hBL6A6mUHJj9c2DnkrjL0U/NhhuAeXW6Rq+SX
 6rPm8TBVbBt1WMqe8vkbknxNaFSSuqMBd8tPcxfXb3VX5G8cAWq/KjKOEvg8SyCGRkdAXIWrrsk
 TaD0q/ugRLq3PkQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: n55WUDB64ruWFhm-zIo6IHpT2wy0aIf-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXyrBGrdwUrfpC
 sU+hAFM5nh+I/z6c9y+b8ryRyGHQBeB05ktxTwd/iT4hYLSWXGaBadcLun37bFw0hiRzetvMDaZ
 Q9vf0pUfASNx9gBYIvjE+PkxAybn0pM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX+o3FArNhqcNb
 sb9B3mCRrE1+5AELwpIxxEs2UTstCvEmRnhFUfE2Jx6gkc+2r7rmMYoVjUx7SWEGWu8dIcGbuTd
 srKvWFdLA7K+p8lOA/Zg5qX2oOzM0gvB2n/6sLu2derH311jVyyunc5RPlbKhYDHCYbE3+xYoi5
 kAMZq5BCdk+9uE+GLgSe6dFgb5f8Qql51oSqNC9tRv8KFQSInsPZvXenhYmQki8e1o2y54zcbdH
 mkIQvsFL1nH4LUzwdOYtcoCN2gewAQQJ08SAJxIEyAr5Fjeuvp+fCiSjHryisyXqonQ7q75m3WD
 8EeVzQNeQGyITIBXNBXq/eEFQaI//eYzFdecaFPoCQr9r05dacZ33r/e0bgm6OZdwht9JcJ8sql
 ZNzjPVPV3l3M6AhQptYTBX52qTOczKS+GJJu0YEiwzeaFHr1AoyZ3KKU/uQp6zjEpGiYKsMORMA
 Y8vvir6uEFvZZrjWuiw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: n55WUDB64ruWFhm-zIo6IHpT2wy0aIf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the SM8550 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..f9423aff5dea 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,14 @@ properties:
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
@@ -44,6 +49,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8550-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -55,6 +61,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

