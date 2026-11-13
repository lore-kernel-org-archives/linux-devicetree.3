Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545746;
	b=aOqHYPkEuzDBhvQzbZ4ZOEUb655JY3OkQpt5u5RgFwXvMbZGH4KqzfM2r8cFKykeIrIm
	 iigO6pT8gf9wMLnJOt8+BZB9dq5p+qikYpGmWpf6/+C7D1Ho4DkwXYeKnNuWimitCHiBp
	 jX7Pkibxe5fQFZ2hq8po0jC+xiSneqryK48l5ZPbchwlAdAtGj1HhCdUPDs3p/+StUH0f
	 gurx9lMX8/Gj/igXHRLil2asu3cm8i5EsIv4UlMYudgZMXZ3j+Rfk5bLO+Pk1n/Q0KLZj
	 fzobAZAA+gi4ovYIY2DjTjoec6q9uZpstiv6ZpUHoTU9m3nCXyhV1CMUiEEYoc+xJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
	b=4E//vDeDr8W88VaZhLACC8LlnScnd6yHWcjkfrvvYEBPk0QurLnexipZ+aUtAaz8VNes
	 4CJBw5e7fz8ZIkMWfRAklC8bQ2pGKRY/rNusw9JdrtwxlqTwtCGibLVTaPH3RWW4Cgx10
	 +yPfEd9kWbLKvUWL5wdVdF+ogipx+5RHHh5VrqprWuZpBZPidO870+MnhYHfmwu6Tnlta
	 mRUInBA0KSTksfmwYI48hMP8RjtekEflq3U8BAE/O1TvKpQWBlJHNcyjySyMLm4g3H2Jp
	 te80shB2RojKmvuYQ9NOpYeJQIPuRoCOgbgqheGGw2W+7gPgLF4SuhVMXVBqTFhNXBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBWHKYjR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESXWgKiX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E8606A885
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 353E8606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBWHKYjR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESXWgKiX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KNCe1187316
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=; b=IBWHKYjR26/n0iWp
	tUtKanhNaxhdmiSuxM1CmeOgi8Jl0GWfQ2YsQm+/cThGLSJnrU1jm0MZSwVh3Qz6
	ReL4E+lqlQXpt+109sqtSKKRJQfC2QRwlqk2kTSOsfcA73gAVVONHQyzyfGmu45N
	W1KpNILC3s/+8+0iTfOqxHdWoGWKQK/R6c/7l7WqSmzIHCYHLRKy5MNhjjdymodx
	ZoBIiU5kSX1PjQm2MOpAC1TvSMzEz3CEPX0jTuuD3M0FTda8rUI7N29XZhw6JcRI
	HVWnEwZVthcBxy2flsuliM+O8gdedgRpw6qPsgItANPv3jKalNgnJSDGJu2k1pBf
	NSSXLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1c3yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:55:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso457296a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 20:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545744; x=1795150544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
        b=ESXWgKiXZ3kImN35leqHplE5cVOanwt18FYUQ3LcGpIYE3y4xEvRrtiMsisuFdOvc5
         gmkN8GeYKjhQKdD6ni8I7nq7DAlaG0d7ddLxVD3jbWRqboUMHSEsgInWf3M4+TxwXUH8
         FWXqTyIUerNWmkL//zLWKfVCf5F5SdSnZGUUyRAg0bA2CmjOoHWOz7wkIAn51aWEc8gs
         m2U1qFamHDVFqGUTmEomsXj35BnK4kFtZzqShA6UlL6Dgz01YfDgwqG/UNkc+D5ANeqz
         J229P/52P4a2WzIo7k0xGCoIUSOM8OrXNhGDAgt9xr+8p1shrnD2AmzrW84KVcbmgfBw
         v56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545744; x=1795150544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0xt8hWG1/WYmcd9Rnv9SnmFXfN8wIMxECEAa2dy0yo=;
        b=qsbHysIyWSlCAtzAV7CWePKCXLq+aikxZuVLbC5bGtedN7YnsitBoZu27LAsXoIrtJ
         d0bvOXY0oCU3DismYZknroYwoTEuiruNXUXvnTAfkPR6f9NJQNyyAuHNhXeTBrtYGyOZ
         0ek0Y2viIeNbhW/UPEKVoyyEAC3NpnC7XAF1vDCQl/LFcNqY8OrDs27li14kVVtjdRFw
         KHiXvPNHVrtAor8wCp4VabF/wUrbFSaGbfigTX5mt9+/pDxgWaqQqkrFcd2j2xLJydc/
         zVPy4WRBBkGV57fVIlnirYa6wYtBqbtHsS3hAiT8o/XpJSaI6Ze3fcsEOT1ZjQvjKHu+
         pDMg==
X-Gm-Message-State: APuU4Z/ghVU+J3kq7Te//X2YuBa0T9pTsiaUKhp3wkhMGa86OFc52gUL
	IychCyJ9FadqYfrBUxdo1BZeOusgqxJT5KpEmrkhPqOWftrejUepGssK+VTrxbGVo4fSxO8mMCj
	rsqQ8QoIdsw5mu/PItjffZnsBXoeVZdek12vbSXW3BJOXkaAhp9xhGp2faQPoxia2
X-Gm-Gg: AYBFou2mlIeKqBfmJbgbKSkxwl5BVOD693F53E9d+GHV5ryv1riCkFqvOJH78XPlhvR
	hcRkPj6LQrFXObGU5Ytsj338E58vkBlZaXXz6B+qORYSDwMRpkMNeGN8RppDrfTPZuyHDO/sqJi
	7IZYS5ky6oHOAfBEIP+N6m1YxGWiy9npRhXoUTWaRIHfMFV+WKbAYbz+llM29qbZsgWLxR8GOSI
	MZXTH4P5vlip8aZsQ8B3vxmoyBwdzUbMWpWrAqLWJlMSylDm6I2IECNPMa0kZjoJob9uO/7ovKM
	19Mq5xU0QknL4fQMopj1WwpKgfnIWMj9J2vgk5t0svJyMxxQw0RTrE8AwlAvndV1yYGKP5Qluog
	BXnLP9OT8A1M9f5efEgwSFxH2a1UkBI7C0Fv55TFWInv/14LTLgTluUgnSR5SJ2BfcFRpXJ5HkC
	r7
X-Received: by 2002:a17:90b:528c:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b1b0a5030emr956412a91.40.1794545744303;
        Thu, 12 Nov 2026 20:55:44 -0800 (PST)
X-Received: by 2002:a17:90b:528c:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b1b0a5030emr956389a91.40.1794545743834;
        Thu, 12 Nov 2026 20:55:43 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm7739875a91.10.2026.11.12.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:43 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:25:25 +0530
Subject: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
In-Reply-To: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794545733; l=1611;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=wdxVHUH6U/hkNef6ynp8u9yaYLzY92vvK6sKGzYVMG0=;
 b=odxJJpkblgPN0yYCR12PMj2iwhNkYi37D9oCcYCwazdfDbcoy1eTNIooJOFotBYEF2GlzuR55
 5iWFxUUu3+TDIuQpo7JlBqKpQ4LHHcXj4XfRvdf7HLdU0NS1MIZnilp
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX12npSdtb37K3
 Sxa99aNcJzTKL/+lY7waWx/tsaj+Y2S06SAvdlX82JR0fAewEYjfflvbVnCTdo54WHcH2OtDb6x
 ROHNvYopWRnJTKLqZyr32mrF0ttB+GN+hkhIKpxXtOqdzBQKMZScZKv5TGJU+SC/VX6t5jZPRY4
 QJqOdzNlZbjwNdyWQVkplqQdlbuM2qegIRRkwFcQgmHCYh27fkRYtmRc4nPaCQD8QhDszi2BEtR
 Yf0Toc3N/M02kij+PlmXZkg6L2Ci1l0qMtg6FF//qBHzLco176wa5xYnUrxLhTqgypVfa2TJjsX
 1e69WbTKNg8m/PyO1q6K852Jov/0Tvl1Ahijv4PUIzT1XomNMTKIw2WjK7nh+K4w/LSUURWg60G
 f8ebCOM1jPmzhBzvx9owOIubPubo5rVbCNwkpFpyz4gyVTnq+aZRd8HUrx7ZHBJDzG9edsvf3T/
 /eXNYjs304azkfULK2A==
X-Proofpoint-GUID: ikyghNWqli57_lsj1yfyH8SDJA7kbgl3
X-Proofpoint-ORIG-GUID: ikyghNWqli57_lsj1yfyH8SDJA7kbgl3
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af69851 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=Qyttz2GgRPmjqTwtHG8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX8GOpFYLcMn16
 0mnFx/Tp979gZAVzf6K4Wh4tO7liXLxyJCpPXO85AAmrFVQpDTzMkg55rdggy5dhalPsXjk0eYs
 xPtC9dNdWHrDjijC5fbaSnsNVHiSOZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019

Some domain idle states require system-wide coordination and are not
applicable while the platform is up and running.

Add a boolean system-state property to describe these states.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
index 4dd4f59bbbec..b19952f6225d 100644
--- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
+++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
@@ -45,6 +45,12 @@ patternProperties:
           state will yield power benefits, after overcoming the overhead while
           entering the idle state.
 
+      system-state:
+        description:
+          When present, this state requires system-wide coordination and is
+          not applicable while the platform is up and running.
+        type: boolean
+
       arm,psci-suspend-param:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: |
@@ -77,5 +83,13 @@ examples:
         exit-latency-us = <40>;
         min-residency-us = <80>;
       };
+
+      domain_power_off: domain-power-off {
+        compatible = "domain-idle-state";
+        entry-latency-us = <706562>;
+        exit-latency-us = <706562>;
+        min-residency-us = <1414124>;
+        system-state;
+      };
     };
 ...

-- 
2.43.0

