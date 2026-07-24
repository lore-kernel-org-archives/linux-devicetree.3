Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB719402BB3
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888203; cv=none; b=JsGzktClg3vcEszEUI3aJEch4qcGT58ivuIUI3STyJTR7Y/WxfKSVRnmKKBKQGpJSJVLIdQh4ysilPWlqL+9IT4ZQM4+nOU7pyxlMj1RdCIxicW/dt98+lb3Bd1bEx64vUS3/TbL5nLTH9xUYaEQcrCntWqU6lDqcQPgCRD/xu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888203; c=relaxed/simple;
	bh=Gg8pfgywlxcYei9Mii0RUAam6HrLjjKXJC5mA4x+mz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LyoRutWDabpNVEfW/JQjZfJXHGjL7/6150J4soeqV8HF3002YqkoFlObJbubCgDCL8d9ZWkWoe/F4RAw0wouQsIPI7e8JlnXUmMp53/xZnRU3PezA/rbUQx6WUhbE+UnwepmRBoE44uw5HUQSnqeSPzz1jG6lv38quBpDqP2o2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ5EG17Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQFJI2Nu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ5EG17Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQFJI2Nu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAES0S2853665
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HoPwQn4agX1K+V2yZEc9md
	Y1aQzQYOy4tsJySau3Wys=; b=JJ5EG17ZKr++nunXL0xch6IdUNkz+XD6cMqayZ
	u12CZKZ3iUnUuP24ojLQDYuz2RvROSFBgnn9yrlIEXx5fmi4q+7YHDqzx3VuO2fH
	jjTJhC7zaU2ev6w/2gJM01Eky1AQJcLVO3cYCGsz2fukEtxLXq46xnP7P3weqZ/p
	rDzf+ntET2cD5HzorgL3zQsRKzoRknySUWdEpqnIOGsobBD1CSi2lIvher1onuEJ
	7DZmH4+xHILQeHHuutIg8u/3OJ2Z1aAt9eofPQXbjMdPwnE83TzMMvsN+nVp2fl5
	yIJplteXi7NghPCvNIdrqmKi0Ab4QB4NJXuChl8rG9iT1LDw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtfwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:16:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so332250a91.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888198; x=1785492998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HoPwQn4agX1K+V2yZEc9mdY1aQzQYOy4tsJySau3Wys=;
        b=OQFJI2Nu+Y1iGjy/WYcLOo/r2ci+JOh3T8iDZNlwDWdzXnOJkpy8T30SQNjWNVA+EG
         KsJLB9CgnpSl/ql3Y4cubZFS/kJYEYcaWGMYxc9Tya4oOyrUE6PVeE0iQ2X0IsOxwyD/
         89tw/CYSrcEb2XFCvB5cRZWtprCqipd/AJoBJPSRrKrZJdgoL1zEr5cEhInDODdufLCp
         0K3ISygiARiuaUnUbtSKlXnheq8GTf6DsuE3V0I71dwZ9YLqU2IcvZRDcg5PJlXnnSmc
         mEzQwjDr8arwC2C7t+b9HNP7EIclVtXV7BXf1/o9LkOmWoiEaoEZHBBIOhp+zBLLq6uE
         56nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888198; x=1785492998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HoPwQn4agX1K+V2yZEc9mdY1aQzQYOy4tsJySau3Wys=;
        b=BmxTzJAWmvclglR87MxproZTRCmVtA1fvDXgJZcouLGfP+tVXC1fVMQs5wps98bfNc
         0lsEMXXNSk/Zn6ZoH05aElut+/QXfIvtdBewz/T/EhpO7GRR+s62U6aPiWxnU8N0w30f
         bbwK+r0XxD3lxZlfuv8nVSYnHBLEFUs1hiw0eiHQmslCHPSOhQjzhT8JxGwS5VRZq2yj
         hejlKYn9wAD40nFSqqod48TWbIoqMjHkaSkPbhMtEklLaD16etZfM7xwTcP3xT7GoAQh
         ie87lxI7//0agxYlwDLDygSjeVij1tNFkR+icL9FYW9MPNad6wM/ImTJWubvJHd7ChK3
         jHVg==
X-Forwarded-Encrypted: i=1; AHgh+RpYgAj7MAMF2M+ymy6HrgRCSOwieRemOI2EdSoBNTHVvKB/kBsexareEBcJrmAsEhkFaB8QjZZ5YglO@vger.kernel.org
X-Gm-Message-State: AOJu0YzmSXeWjxILSoFltQBbj1Rampwbxnw4fmptNHxXMtQpWSHLwqZl
	4buyi+yzP8HBwSrzSFbblriKX7eyzKM3UbzxAn3JorSpu2V8jt5uXGEDCVimw5yHeO8CGh5CrBg
	0YYfPQ8WXsdlzVUJRSsS22a/nrL5kB65mjk7sz/bNjcpZlQfYFy5tpEr62TSM4pL+
X-Gm-Gg: AR+sD13v9TaynEeCNzlO8pg4WHAMJBaOd67ix9BtAitLC/X4yuigy9JAGQyG6wJNrmS
	XNAIIuT7MnYRdMMRWxvzKg/eJrJ9JH6H0QAAOK32s7BxNT6PIcvHbTDca/eA9GsJNlKZZnQnm/k
	6zSZ+1J9f2ZIWIm4aC9GIoV5jij/UPTqv1sVqcFHH/B6YYFtBu8qgI7KJ4Be3gcNV+FNIEGQfrI
	RAHxJXd1QeLZ5qsp5Svplvx9cMZB8FK5SCU8cS94ufZ3GwNLFE30IaA8KWaji2pEPB7uCpNzKsF
	iH3lblwWbLzNEFhEdYBeO+IXuqmTpgnpC9eKsBfsjKiM5P8iLJ/I5Ud8yG66nHikjpfsE3wvx2X
	uH8nOIZau8SwKTMoBhut113ZX0zrZsFfxGxhRXKGR/UmFPab2uK8eSC4TCd24msI=
X-Received: by 2002:a17:90b:1643:b0:37e:9e9:6ffc with SMTP id 98e67ed59e1d1-38ec65f99a9mr7285566a91.25.1784888198296;
        Fri, 24 Jul 2026 03:16:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1643:b0:37e:9e9:6ffc with SMTP id 98e67ed59e1d1-38ec65f99a9mr7285535a91.25.1784888197843;
        Fri, 24 Jul 2026 03:16:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm1222644a91.14.2026.07.24.03.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:16:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Fri, 24 Jul 2026 18:16:10 +0800
Message-Id: <20260724-add-coresight-nodes-for-shikra-v6-0-8b0d7300be41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGs7Y2oC/5XNQQ6CMBCF4auQrh1CS1vElfcwLgptoVGodrDRE
 O5uIXFnYtxM8s/iezNBE5xBcshmEkx06PyYQu4y0vZq7Aw4nZqwgsmiYgyU1tD6YNB1/QSj1wb
 B+gDYu0tQIGyzV7wRRakpScgtGOue28DpnLp3OPnw2vYiXb8fuvxFRwoF1DWTVNjaKCqOHjG/P
 9S19cOQp0PWhSj+U0VSrRa85ryiTSm/qMuyvAGetjKNKQEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888190; l=2199;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Gg8pfgywlxcYei9Mii0RUAam6HrLjjKXJC5mA4x+mz8=;
 b=KRgxAwGuIly4wPMcYYlQNGuDPI6GXfW4aHESaqI5LGQFuUfi4fUs/EdEEPR2q7SIoUI/ZBBa8
 EmfioEZXA4JCKEnLOYZR9wMTzf/3MqP2NZP3WK2thmZ1DEoUKWcS7P7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfXx8pfkF89+cGy
 fM7Tf3CO/11HYT+j+C7qIdqlDoTCCFGGt4wDyI1y/7nULvigKU0zZMFy/eg52HPk6V+u3apJ58g
 XcOZheFGfQutR1HIJ6ITIYO+qMw7BJ0=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a633b87 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EMqZLdzleE2vVFLpZJUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 2p-c03YfkwlnAbWaus3TfJuxYMY7IdqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfXxHRl50EsDOQz
 Dx593PWzsCUmr8R6FvgAX6dqC9/4j7/I2+oj7zfMckq1XxGFu9s03F8k8r/m8mB7gzO8uMkuDWn
 TqVCBaX7FqQl0s9kdIt5BCv0rP1cIwqNyUCMM0mANOVxjSNZZOOeTzAF8uzhz4ZRVwP1bBRYUd/
 MCusS2IMGVFG+Bk6u+2rBOLj+GGUcO8VoSl3d+HTsX/yOIbBOHHs4aUpm3svm4HN+uWDBpgz7Fh
 KsU2u/hHJJXevDOt+oejPmhKzWmfH20nCThph0Lu4+hVHxkyjx4pcNPmfh7MD4c3E38YFidmAzZ
 d+h7+wlrqWkiAgS9ODA+Xgueq80NrG9GC6kTE59p/FSn8XDC/QOFkFsMJxe57xYHeXChW/5zeDp
 YsGQTtn7KZIh5Lq/dm/cu3cBn64entrx2lj9sE2PZSkX4ONjQ/TVpFxbEfvSNxQiHJQsRgX8wv7
 a0og55v91QxOJgRs15Q==
X-Proofpoint-ORIG-GUID: 2p-c03YfkwlnAbWaus3TfJuxYMY7IdqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

---
Changes in v6:
- rename the modem-etm0 node to etm0-modem, group with other ETM
  devices.
- collect SOB from Krzysztof and Konrad.
- Link to v5: https://lore.kernel.org/r/20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com

Changes in v5:
- fix the incorrect version number: v1->v5
- Link to v4: https://lore.kernel.org/all/20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com/

Changes in v4:
- fix the wrong subject for the dt-binding patch
- Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/

Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

