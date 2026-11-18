Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985414;
	b=ATU+0s3z0uwu22XM2X9V5snrEzSNaiCGSGng51DkOJGRZ3akFWoI2daX46RoYVg7Xt03
	 2f+u0HNiYoUAuCrQ2C30ZiCnVJeEa9oerGjMepK8BYN/HwX++mIXuYI2x4e+MESedZ94c
	 PFREtb0K1FCdeFZutRYRu7ihdlt2++RyE3LixOByVy6hi7I88yM+iblifR20V+dwndae2
	 vBlzlLLvcOmOfsY59/pPYMxlSy6HdJqjDM0L3a7VUa2fRfet/Y1xKK2RfH4sGo+3UZy4+
	 aMdpyWz64iDGuFq7loNU64ld5qb0PLqUSLQ+0NeQV5LjDHVSWgz2a+/1fRLbNMEBNAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=;
	b=mW0NYuZLpvtdo2g/i5FqEWy5rdLNpenIHWqN56U+mBkvsM7kgb2iZRyNzz1fx8oQ1hWv
	 K2bCOIvRWSUbZHJPg5PKvMO4Rh9sjbp4rVvX6xWs6B0tDc/GCwwteLrorUVyJzCFtMbHm
	 JHlfncr/v2CQs+OATL+S9smwHYo6qLRtPjTmkGmA+TnLWMtT+tel35zzuIz6GGYQ2M7YW
	 Tt3Ilqbpn9jLzAbv2YEq2+V2Cd1IYlofnaFysMtv86qZAHhHafu3kDmWu4HehkUqMR1mZ
	 GXzRZxaRMCz4HkNtmiKrJ29oTSda1AZwzY9tP4p3/tH2yBssQvBX7iXWyXyVDrBPTWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l5Jn+c3L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GotCe56r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A605606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A605606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l5Jn+c3L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GotCe56r
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UovR3371277
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=; b=l5Jn+c3Lbvj79i1y
	26zcJSCI+fpe//GE1FNW8WYQBNsA+DE6eNgrbBl19vLEgJDzVE3dFgv02SFAR9vj
	LvcvlywwqXi3H3LjQvR9fy7kDb0p2sAinGgb124MRydFwkenJdcLPOIUCIKFYTb8
	jGbUW6l1gDkDExd9eRCgrjEvGzWD9iroHMSXMw728hejvbmFlGc64+HF8jXr+psV
	dOGrALCqa3TJutq+wZ9PBVu2+4x/L9tf7nzDnJq0MYL9dP7P2JnNimsHUgk20UNQ
	wplLK/G+VNRP3FEMthCB7cg25enSD9XQI/mIiLt0TKBp2m7f+NraTI7YKo+eaDyw
	8tQaOw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8spjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:03:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2edd25534afso5298435ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985412; x=1795590212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=;
        b=GotCe56rROXBTUPIhpDdGC72KsiC9eG1NQvQICEdDrx4ZkLwi1Jpkbt/Zvrs5cSnY9
         Ao2Q33L48r2AjhIY9z1GBkAJZOUWpeknihXppk+pE2fTr7YP5y3OTZIdd29Sa9LMYczS
         E7hgxV/4yLD4uOFnMBqwda6/7+Ez1mTzpwclFl7cS8+jdAcUXDEn/1wae2L/dR2g7qws
         iU0RAt/o9FXCuAzBzDuvm/OmpmdTjSjIroZEJv4ltvpCnz5MNFB7fUGdM5GUoXz9cqwi
         XXr5s+WF/D7vBU43EIpzWHi3qK5bn1p3bBDpOVNcDWvtSIhorNlLnciTgUyz876iR66x
         2rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985412; x=1795590212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYudl4zTAefEeFizlvHawbzEC43k5HGyy6GITX53aNQ=;
        b=j+GFsEavF8Toa4Z1tCsia28Dl1//tmR+f/2XkPjhsw+3T8yPU5yZpOReAL65HymvjF
         V2o5STn7OdWpoSNOduTyRWEgkrKQS30WYOw0BrbH0XJMm6o7i9jrI12Og1ET4gy1k9sp
         oPrwmMcOUAujNJqplxBjAL6MrWjwKGxLCN0tjdaqeVYih5nFrhdCLfnhmDnmy/eW2zRZ
         iRFvhZcFtKvVQIy+pzUbKqW+CAXBI7iP4IkUg+pmR6aTYvyneMKjMsceVRqlQV4DPeVl
         khBo2m2JaHIq439HlqlUXeBuhTuvcnzhTTgy+AyAoCFAQr/3S4EZTjVhozAE5rRIho+F
         miGg==
X-Forwarded-Encrypted: i=1; AL+hErEGPN6UI0KjDOeZeiSuBju12YjwpuFRR8/mHABsTJLyt0avWGse2UPK2FBf/KpVSNKhW2Zi4RqPjVJf@vger.kernel.org
X-Gm-Message-State: APuU4Z+nuIHhp6+9fwVfowQoHhwPRLa91ZhiwaayIzz7XTQoB3rJLPsZ
	wRrbEaENrnMI1MU0T2kJ/afTKXihOb8IcuPFBZEYrdOZArpsnVxGfJeHpd4xHapBIRabFss4tum
	ZoZuMJd5JOSFu/VGOtbAYhlppQC81m4WVSSbc+GLQ+dbAYbEZ1Ech6G9Dda3wJ3N2
X-Gm-Gg: AZFdTZeoCWqHRpTRPPS0FjquahHTL2c4Xz2gWzDq8UN736JPX+Gi+O/6LWVIsS1EDYe
	3a+UXw0kh8PIZv9jtVX8pgAqHcHArzb6jpUkVFwfHpdCUZnAYiXWTPuaU04krf8BeHyeVpWq9gu
	atwcaoFzW6pmN3QqZYKEyw+S9ahet/4rDYxYkhyvvnbuH5UoGPjhAzCxtUoi61ZtqXYOm0y0h5A
	VcQr6GhenN3U1K24iTzJLM11xD+j/N+1r87cSJoU1RFdayT214n8wuInjZry1i/Q8wmLlRZOrv7
	H0VQs09zMV5SIWBROcEgYGWfCjOgq3qP+fhFc0cx15iPCzzUoIM+yzD7P+74qu1xzvmBe82uagq
	sfsmxGNX/13vzrYecMVmApwWKy3sLZjwvFNGW1wtNwGTWlR5nxPjWTXQ9AumgV+zP+cS+VaiZ9q
	47dOYh3pB5ukC1dOIR1j3lvYHf3oh+Vz/rbEpH
X-Received: by 2002:a17:902:e842:b0:2ed:45eb:51d2 with SMTP id d9443c01a7336-2eff753ebb5mr17146145ad.47.1794985412425;
        Tue, 17 Nov 2026 23:03:32 -0800 (PST)
X-Received: by 2002:a17:902:e842:b0:2ed:45eb:51d2 with SMTP id d9443c01a7336-2eff753ebb5mr17145685ad.47.1794985411966;
        Tue, 17 Nov 2026 23:03:31 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:31 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:43 +0800
Subject: [PATCH 1/4] dt-bindings: arm: coresight-tnoc: Allow
 arm,primecell-periphid
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
Message-Id: <20261118-fix-tracenoc-probe-v1-1-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=937;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TeVraIqhbDFHZcEPeLmrE50XglecDEumWkgYuypCThA=;
 b=byINxjI5qiUFjrVT8Bd6ZQoPOic+g2n5taWi2o8FjBhnbse+GRwC2RK/L16P/24gQhz/+MsYT
 yuyGYk7udgmBt9gJSil/WahGpzjntj7Es9LQKr4S183cz/GRtlfCrHm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd4dc5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bweLdJAXwlOP5iKYJ70A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: YbE98DQF_3_ATl9suAcXJfwKOoI6xkNf
X-Proofpoint-ORIG-GUID: YbE98DQF_3_ATl9suAcXJfwKOoI6xkNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX7N7COJJLWa+0
 HpEdSZn76CQHyHuNj476wFLT0lUadcFM1ICt1f3FsMjlbr6oZlTpDQemrQ0z1QSYbKZHNaYMlF5
 f9qu9KdFnYVj+aNL/lMgwoQt6SZIv5cbIvwTz1ems/gqbxhQZH+QpFHy618NLIaGWy0goJbdcIP
 aOI71bw5ZgJ6Nncwc9wVbqR84o66lhPYHaXFbx2AVuyo9vLYvvrns21aNg6VnLfctTWsgvZ3VMw
 r0Gxw36uJF+rqzTcnmvNwfodHE8KMA1FI9dh7N2Vml/jP0y1m1dTc0tRihHQueWz2gANq0ywz6B
 IowmZ4r0SQqR2ZjS28jkbGO0T4OKS9ZGOW+L7jR2lC6+c4xshPiL4hwuxpp8JJd7Dz8Iq4dWSnv
 lzCSloTyTqxLXt5PrRUyFNeC/6GQNUTNVE9fxdaHqWmftIiI/RlEs7vSxdnhVzo2s9PlmrwZEft
 sT1cVaPrRHo32QzaAuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX2AtCO25i8nM5
 vcHbyM3MDa2uePI+S0h66XARA51nEDFCBQpXe8EpjIEBNcK8EPn3l9fGLi77vcXsuDVg2XH1XIs
 yElszuisPdqdzToDft56jH8VUzavnM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180027

Reference /schemas/arm/primecell.yaml and switch to
unevaluatedProperties so that the TNOC device accepts the common primecell
properties, including "arm,primecell-periphid", as the other CoreSight
devices do.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index 37147124449e..99ff8d30f34b 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -78,7 +78,10 @@ required:
   - in-ports
   - out-ports
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.34.1

