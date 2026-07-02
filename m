Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8DE480DFD
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985863; cv=none; b=u6zFKKwk8W0hJL+Herebvbub7rZ/plvB7nub+irv6+kzvXNhQYRoKWiX+5+0quyRJ04/0/t746Pm6QFNehHk9FCWf0Z8umIp8/pbbsHKrXwYpVxC5aFaqTcQZ1T/23q+kBOy6X+SZ8xQ3XIOD15Ep3YUB3IEkg2zm1PSY094kzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985863; c=relaxed/simple;
	bh=9nJ4RWVS4xD358qxJqQ8mIalRRMghPwYWOD3PcvvDzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfOGpVhgQ7VwPmZNx+hIKwrwkpN8paJ/sqtIJPlm/b2NEuai89J2FsmQwqHQwEAXK7Pqm/O2noqW2lbbXk8bPelMHxODXMQt9OYW+V1K420sAI4irc2Rdr7XXEurzKv7PRKy7TB74BqiOAl0R0OGgD23x9RG/jB29B6QZyKOzPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SU58JKpZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4TAIKDU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SU58JKpZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4TAIKDU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628kq0o3049496
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=; b=SU58JKpZQ1TjwFrn
	4MSRJTjLcePUGT6AUoeKIzdQrUEvnAJXDd7F3ryH+xEBPSxxRPpA0xtXsSrYsJNX
	4n21fNyCVtfmpUzZVNZsJHqY7O2d7BB085k14JZQkNH74+P5dubFlYJBBVQgmbda
	VYl50ymI6+a061XPPp7VVcWyN3LW4KUPs0aPCl5f2G28WiLdSvs0pI68kpCllgGd
	hK8Wa6Azb/v8gxN8+QZGWZ/k4rWfsGRi1+0rh/qMUpVNVZxOohs82UWkaxKHi1k9
	1GZbW9p/DxJzw7FwyokH8HwU6iNC/6sb11kZM3dAtXAS5q1EbW8NmeU9ZlujX9RF
	AvRKaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541v35a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:51:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240683a82so464802b3a.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985860; x=1783590660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=;
        b=P4TAIKDU6wwojf5cQ3AoqAZYNm/zFU4rawhykzLBgxElve5yARnHdj6ID0QSVeLqBx
         HDrefc4bD7K9LNGmSrTDqykWADEpwADwcoyoMgI6xfVFQyK/K1Us/40MB2CCF0vakeSj
         U8ZULWuONkgL51TC9EpOwXRTDXTJp8/Abg9FhIF9gcspxHOVxwfFGi39nVg8fhXX8NaL
         eu0fohNc0dx+po78m692Tk5v6s+W2ViIC8ivKgfIWURGfUEZMRb0bJhckh/LZqWpEYVw
         xTi+6XNXMqwsVO2rqJ6AITC6wWik+huTjYgA/W+c1S+KB9JIuhNnOfJibvFeC7fgipmN
         VlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985860; x=1783590660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=;
        b=W7reN+BUfTKZtPBwboHsCcXDLIwEEN93Oi5kh01+2L0hsqUdbHKT4F8piSoAIvdqFS
         lXHtSeR3y+QlgcnzDYAU6zdpQr7ApmlSjRh2hvWgMUUD2z1MYo7PoW1vxWE9HeEsJ3ZS
         PeIsOQeZFn212mnDDNQuq0i5sQe3Hs7YI/B3Wpk4alQgbUz61E8zZCCw/t/SdMMQigmt
         IEG0ZU+dLvlNTqZUu4YO/kQbnaK2UsPwuYutdI6+1ANg6xFdNKcWMuuVoMvORFhuspt5
         Ev/Pgqm/IbWl8AfXoLctKMRGa7bNNibgZ1aiwYilIt9Jm7SHX8AiX42pG8lRABjIultS
         ZCEg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8LJ8RHgYtAqVY+1y6cuPZGS1zfDFKQkXGikXnbUHsxXKkZKLetpsJRc99f7+hVWjDGKmiuruHf7te@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQBcyRj/S2n3HhaUF0nwCW+4Ovxh6puPp68Ln64bNv7k+aFkC
	ntxVbwJ4ivyqMuvHDK10S9jpJaeD/OcTe4EXYSEnlr6XiN4y3gPjW0AYVeg/VvQ/3m/Tto8aNTT
	zIfLsYpm+h2/clvOB4iJxN2mAelZIwYRAXKuz0a87H09FjalDhWlf087zxmBo4Gzk
X-Gm-Gg: AfdE7cmOiNHLJTK7foF7XmbI/rvI5evPEmKOgcuIjRwOGZ+3nPxxsUUjj2EOpmwNy0E
	qE1eEnPmZPcBC07e1RNI4g0citH0qBZBEIqm5qkDUd7tdUA4aFedO9QwUzylcHxOafF2gICnvsK
	0B2I7OXeP0Jzp/Q5Y0y4YL8PpIXe8UIKMf3zhc6sPLZhs4c4lu3hR90Lx+AlNeJxs6u6jTP5+Sl
	lk9SGDcn7z1NgB4rdF6hNftV0WEqYD74mTgSYVdOkrmRGB0trNbiR1DiH7kr0DOsewdWE3MezO4
	pwk3l9MQZE5nktDbbsWoir043VZB2KSmjUnppxP5q5bCM0QRbZMpZ5/nFsOHYfzO8vpksG2u26o
	8HhvAMBZazfy3cc8HYcOjxDFWEw==
X-Received: by 2002:a05:6a00:2e18:b0:847:8704:1c57 with SMTP id d2e1a72fcca58-847bfaa89aemr4615516b3a.31.1782985859782;
        Thu, 02 Jul 2026 02:50:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e18:b0:847:8704:1c57 with SMTP id d2e1a72fcca58-847bfaa89aemr4615487b3a.31.1782985859351;
        Thu, 02 Jul 2026 02:50:59 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:50:59 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:43 +0530
Subject: [PATCH v5 01/11] dt-bindings: interconnect: qcom-bwmon: Add Shikra
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-1-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=1132;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ie2wM60+tAThpQPFlruvov7NzPvO75/SEoFhbJfHGt4=;
 b=ZIP1YiQcXGJE7g4pWoGmEXtb3ewqdC70YHVWz4xY5O6bKf8/cGA0aXgvVCmfw/GSOvWdwZmDR
 qnvxbdh6KvUBh6CgpQnPLnXZMjWULORJiFdySKPDwY1W465wv0Hyjhv
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: vnt6NZsDl4JIQ3S-HOMpob2Zjb_UTSOv
X-Proofpoint-ORIG-GUID: vnt6NZsDl4JIQ3S-HOMpob2Zjb_UTSOv
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a463485 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=s2Q_muabT7T23weRVv8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX7ZvUBGEoX73H
 8WbIGw2u66xJMzGISEkhtTcQWTFjJRE3xtJidSOq7iA18Fy7bokxD8o/Sd8Nm2xt9JYzIJltA2X
 4Mvcr/hmXzrt4rcLhHS+KERvQPHKhl5+ffUJww4ovmvDbWl2iOeBeWaXirbXPtazK+iqdZeQWsV
 NY35wDNyVoN/C+fkheP5Wl6Il8r/4MhJ+we/I/d5wcsgdnCy3rLbI2U6GeU213nUt53FFWDxbLi
 p7WFkBIZRZoP9VUquAI6hvotuH+rgn5cwsmgcpCI1b2l7Kll1fBne4cKuK/Thpz707YC46l9y8P
 r9l2oCNlJTIjiOvSgjDqojuVfAKNiCAP1Un786RVK8BFgOZDttHGWU3p2HLp1NuN+pIoyv0hhFR
 FK1ciqq2Gk4C9qYHWjk7Taa+nrSPFYTysPGXhdNiUfUZba+g3zwHms8YyFVtbHpljrBhFNfYdlT
 294guBLKk2AgxM691lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX1bhXrhmN/3vU
 UX26dbUP/VPBUykBB9OcQk0H6FbgKcIoPd/0vPLfy9X2fXgxiQlzSzKKifRMc7Erbet2ww8Falo
 pMCO8BrW9da0zi4ppJJ8h/XdZ1NHW7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add the Qualcomm Shikra SoC compatible string for the CPU-to-DDR
bandwidth monitor. Shikra has a BWMONv5 for CPU.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index ff64225e8281..8f6c937e44ce 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,sa8775p-llcc-bwmon
               - qcom,sc7180-llcc-bwmon
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,shikra-cpu-bwmon
               - qcom,sm6350-cpu-bwmon
               - qcom,sm8250-llcc-bwmon
               - qcom,sm8550-llcc-bwmon

-- 
2.34.1

