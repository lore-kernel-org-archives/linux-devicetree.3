Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34A43E16A5
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051626; cv=none; b=O+CiStjVx6guIIbyJgTB9X91HqDZ5Ri8DDOd6vLRCXl3O8/5/DsEU3bnY5bcANgruDKzbmmCpNZ6s4WkjudPEoMLp3KGbzSMJTTFRBC9JnDf+AXl1raQBc4V3xucGbre7WkLOH+1bHRyoIFC45kYXon5MOfu0vgWlbEj+E3IG20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051626; c=relaxed/simple;
	bh=4z38/VUu959otE4KmVvdi3STpMaWNNAti/Udzt4akAY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ImCSaofiRU3k+phldfE1D8q2qrtBEkkVuVPEI8fHQtnEfzPP8ANbXcJI3G5I1IwC5ekSNFxmGnjUoRQCl3fF8I9N6RQ/y5p/CwgzbBn9MwtBlJHMjAQAdJsWq0b5RP2IvQlBqTckYZBcNukoaGoS2IKU/691Ywf66YK1FZrioaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kltqamDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLqs8wY/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kltqamDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLqs8wY/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4Miwn3382684
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vlZaNk+LHeQg/ayXJmDPjl
	1Iode7VAx4XLMhr7oLpCI=; b=kltqamDexgw+90ysBBbc2t8r673jUUlfiTZrk5
	YwRALUKtQMSqdzUN7sJRdXI+2y/NIukXi3DJElfjoX9OcIUIdvWxxXt4O8ZNWyOn
	Ixa9HuC8nXlbXM8zAFW9iAACGHHBOYM3jRymcD4uaTQJi5jEkAwmmiRleDQPqBhE
	nNdEx4WRtx84fKgll5+IBo3+vhRHqE+PStslLy/Nr1AFU3grIi7SS63Govu8wdzp
	Spj8CJcOpsNCJKDyg5Qhw9UPMDZhfsb2WwWokNAzBJHSoIr6wE8Q+gJoUGZVQ7hD
	+Rv8yH+CujqEK940tnPcACFZGYisKEsFLgR9oYxriseTfdqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj812x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso6570576a91.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 21:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051623; x=1790656423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vlZaNk+LHeQg/ayXJmDPjl1Iode7VAx4XLMhr7oLpCI=;
        b=QLqs8wY/ExUbPpeMkwQbaGgrgnJtKJtX0ZzIJ+lc4dBdS0cJI2E3hR9BvLX+wNu8WO
         XbN8qDblZ+4+jxS1X6kdYhwR8xVgUoz0N43BqcOs+hjwM4XT6gYtdxW47xu0eCVlFkJG
         zp4Pgpynjw0hq0JVmPkxLmx7ihz6fSaOsO+c5gf2XspZxH9a/4W4v4xMvFnRYB5ECzSP
         vXPYZKtFEuBqIHglzkq1TDuZOg+vqJshqydfYWKz28Z24Al+1NQ2gYW4svsWNG+4ZkWX
         MVHK4+U5YkiSMBH4AaMzYGGeUMFEAlGq1IjPjMeO/faq3jcTbL5KfQzrnfskXjkdKABa
         RRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051623; x=1790656423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vlZaNk+LHeQg/ayXJmDPjl1Iode7VAx4XLMhr7oLpCI=;
        b=skdQMaEREUPBXBbXwyVZWEj796V++OJ4SeXlMt4SOWTpYf4sdlg9olo2xF0KwhxNgF
         qirI1lkRCm9ixzb94seyvBeTO8SXlVLdDLBlLEnKZeRFMh2f7VHm3L7JRTiqhWDcge9i
         gDt3YLC49lTQ+j0wzAyXUBGM+WtCzcbKj+K2dTuEPOSNqyW1zAmJtUvCyYer0AvCdqER
         Wqhg6+Jj1pv7dK7Jo3oMCGBLOCDRhgikqasftMxsiuy8Bz+zvhh2HZKG4+c/2naiZzKc
         P8DMpHvdILRWT4wST4vf402XySEZETwr03K/0tjx4OD7k6tkzVpVHo7BxyPBsaua5wVT
         DMBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKRvyVQ09hogkS8l3gLK1KKJDxcUA3ye6sg6ZDKCpS16ZCLf5BtVh5uW53VrvuOMTlXaMWxHp5b2R1@vger.kernel.org
X-Gm-Message-State: AFuF++kop6J2AtNAwK1qTr3+suuxzDbtkMfftVv66AWMb7GgN2O2cvH7
	xLYfjCbypMXc6i52VixO4+TdD0bHzfJK7bB4ZwnoSC2f3MUVQ+ALdork3Z8RcUscZoZJHjwlN6e
	dcb7a1MTH3DcdF+Jon651yPvGVBSBkq5zlx+KxvYOe00hyRIQh7yAp6LVhCZgmjP+
X-Gm-Gg: AYBFou1KKdxI+tPJakohCRJfRkXGxDrbzUfGSyQ3uh0wRs2t2peJpjdUm9Rdc/jBc6+
	ucH59s+5zGFtJ5z7DxiX+HZkutcD9y8R3Nbbr5EYL67nO186NF6nO92G6dMqEf7k4BAz1iRaOfd
	gAZBsotqMbxf1inPL/ILQzdUTK53FbgSXWq/9wxgGw8iVMOy6U4rL5lUY0TfS3z/3LTH0bl5bGm
	2fbjRGbNyq8AsH4dL4Ja8H7mJugqcW4TPs54Ah/shA+h6uh5rMSuhY7MOrbvl2sR9M634HaBg/X
	pTVm9qtCLVjQeoZKMQsrLzgNUiZNzCjQv8wBEDaY9G/WOWJwlLb/wFwJMqwTWcf3jScbAy5/lRW
	LHCrfuHjcflnShS1N7glTp0NvLK6dXB0K5dOoc+Z6cZ7e+lbmS9hrMof2HOWaOsRBT/lIl2gb0k
	CJq6eHlIcYo/6BN0VEWYvHSnXBoaEn9EQ/b0Q=
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b6c with SMTP id 98e67ed59e1d1-39e6c6a54f7mr10660047a91.54.1790051623371;
        Mon, 21 Sep 2026 21:33:43 -0700 (PDT)
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b6c with SMTP id 98e67ed59e1d1-39e6c6a54f7mr10660020a91.54.1790051622846;
        Mon, 21 Sep 2026 21:33:42 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add few more SOC IDs for IPQ5210 family
Date: Tue, 22 Sep 2026 10:03:13 +0530
Message-Id: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAkFsmoC/2WNyw6CMBREf4V0bQmtvGTlfxhCaLnINUKhFxBD+
 HcLunMzyUlmzqyMwCIQy7yVWZiR0HQO5Mljuim7O3CsHDMZyDi4iIRjP0RyWYoOXgVWxIWK0lD
 pKEwgZW7VW6hxOYy3/Ms0qQfocdfsjQZpNPZ9XM5i7/3sUvzZZ8EDHp+rOC2FUKqur4bIH6byq
 U3b+i5Yvm3bB0B56zLHAAAA
X-Change-ID: 20260917-ipq52xx_new_ids-1b584bc547e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: wr_Ismo0aCMUzIFm7iwMAYy6F3K_6YL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX6I3GVqLkLCyh
 i4aywkuH+XN8fX1jkoGGLl4VkQG8u3AcIUEobt9nP2slGDZJW46vZnYzVVt+WbPng29dJtnJlcl
 Vtm+7GNOiTuBm/VCJ7s8g6WTsQs5VOgYdNVR7cuE+nEkJtV1YvQLG3+L0tIMz9jcXtiYYA61pRt
 Nk5fW0G6h7CrwXf7wdsLS0cxSlxdlkQYp4qz2m1Wy21TDWtXweXc0J83e9Za9fIGuYp2n3TE7XU
 T9c6x6vMu0IzdXhA11Se78P1Vpz9JeE7FcyY5EfXy0YaFKytZxWZi8f3snd3WJ++UovQeTNvSuC
 +EfF2iGL8Cpzmjsa5L4QAxyM+JwTj1/b/q/RrRXFonCt7YSGU0wtq6dbjxsjzgMiRZjnOkqKx5Y
 z+H3oDhmrtlMJQFYIe8IMlTmzzi3rQ+0lQEQa0mJdHXkMC1dd7eWfIJU7ek/ICr1aO1y0olNRp0
 h38P8kp2rE9qtAaSr2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX95D7ioq8K4VR
 mdMk+0nVlqQAKqUL1tX2lbfEnVk16CHvZRdYtwkWJvqm4Jr/fbaAUq6fFUXPIaCpB0Sf3VnAOq+
 Z056HNI1ylt9UNufJLeF3GvrCrlUZt0=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab20528 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=1ws-OcSZzz11igmLXCAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wr_Ismo0aCMUzIFm7iwMAYy6F3K_6YL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

QCF3211 and IPQ5211 are new SoCs based on the IPQ5210 family. Add
their SoC IDs and update the corresponding CPUFreq driver support
accordingly.

Viresh, since patch 3/3 depends on the first two patches, could you
please provide your Ack for patch 3/3 so that Bjorn can pick up the
entire series through the QCOM tree?

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Added the CPUFreq support to address the sashiko's report.
- Link to v1: https://patch.msgid.link/20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ilia Lin <ilia.lin@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      dt-bindings: arm: qcom,ids: add few more SOC IDs for IPQ5210 family
      soc: qcom: socinfo: add few more SOC IDs for IPQ5210 family
      cpufreq: qcom-nvmem: add support for QCF3211 & IPQ5211

 drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 ++
 drivers/soc/qcom/socinfo.c           | 2 ++
 include/dt-bindings/arm/qcom,ids.h   | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260917-ipq52xx_new_ids-1b584bc547e8

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

