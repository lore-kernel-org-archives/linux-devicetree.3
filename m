Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3696388E45
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379473; cv=none; b=bPrRtoCIkCpWBjoGYxyM+NIjWwxWEgZCOvzzcvZdyZ+cCHaZpDBM5IEaDZ6+eNICc4tCe7+wCEAGYSl75uPa5Ghoe05k2gjvcrBPgBdEXf3JV5M4skvM6ksLZer6sJMNBkzhj2WvLn87NehcMWLoYaVKF/b94ihoNXwmJXJE8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379473; c=relaxed/simple;
	bh=q+E+NmWhFlgl54y+4NmhcUg6y8ik/02RANvzLoFg4nM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqNLQAoGgmOvVnlNuWNESWzibhZrp3129Hhzno//H6dIX8px8Qam9PG2AAEZd+yGNFBWH5lClUJ+K9OqMOzp61k9aOV5WfWz5Lu7EGjs/W/eDAj70GgSO94eDcHgFcieL18A0oTwNYCRS+0LpyIIGxCkud9wCPpNOGgGT/cNFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkYlqxAw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2XKnk/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkYlqxAw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2XKnk/u"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHCn81489979
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFNe/WToyK/O4NNvagSNqrPVSY/D88aPNWNMvMN959c=; b=hkYlqxAwAU+NjA30
	wTT7M9bB3PCSx699rIv8TmeKYm3Nu7rOGpTF6OAIi1FqlGbLJWra0qq5KXPL/szm
	iq5raL8zm955oiZU5KUNe0ZewwtiTXnK/Q5OLVd0NY1rz+F8j74KnkrAIV4QZG3m
	6vwm7iHcWYMpnJZ41wNh98h9Kh3KitiYALVw3GyESOC6go2UEH5O06sNH3WjZlXU
	BTlggqVvEpTN6N/Ot3iRaxjCrbJzHhuwf1rc4vUqZ8plBaBYKpYhfp/A5i9JmRbt
	TfS1xrxMDU5dlq3Ir3ZXGMTCoTWS+YajjjpXzOnxF8Lso3TaN3ZHSFJK9xzymC6b
	1saAtg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aarsng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so30799a91.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379470; x=1784984270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFNe/WToyK/O4NNvagSNqrPVSY/D88aPNWNMvMN959c=;
        b=X2XKnk/uxpUwtp76zq/5LV6bUkhL8OLGnQJJ4lbv+CTS6obyhP56dHMTpujzU/mkj2
         NF5M6zkitpUscBXF4k8wNleYPWB3gbqFFeoAbS95dmH/oyZBFQ/BEOqBo3OM/63Lqxpp
         C+kLE9LM9KzSSzklhaz5QqMA25EG7NsSlf3PAg7vuT8WIfN2/MdFrgbpKlnt7x21ipp6
         7R1iYS0Je0I0d//JA/IHQYWFs7mSNhorVWr+L7wM/XpF4qLJB4Hb+4Gnqb+ECMm3U7JQ
         uNgvMaeYHiESUxs2dDJQAETyaceVu8VugrVu1HXAMbTiH2DJYLGRs4jKxA74lulmXfMW
         Ijjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379470; x=1784984270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFNe/WToyK/O4NNvagSNqrPVSY/D88aPNWNMvMN959c=;
        b=U5T+cWr1whljRONA53LPW7Jv+3eOBziFvUxIkSQAAz2LeHpsyGOHiUCb0w0Ia5KZ89
         LRn/5NfHPmdUUqe9i80823covO0op9kXBEcsfkextSnaJCBV34+bCM7O91p3TwyrYD1m
         mjtgsXH0BaoPlYjKSycYL0Qgc9ijqA8Kt6ZHFzAYFjlOc7puKl22u41kfdxc9BQZ9wPp
         IsG1rt6xXGpgRPKlh0YNRIHWb3AzvkeyHR97RpbisiP9VzyAuJkZ4b0VYQFvjvCnPtMs
         FqiIOrCYWX5xV+lxu+wBhdrzsV2MaHe4tLCwDgeGWsolGCthDnvwWyX4Z4B47+yC74QM
         xgaw==
X-Forwarded-Encrypted: i=1; AHgh+Rqw6mXC4zfrLvnBSwn3gBIdNWOTgecU2sFzqMfDZp7eiYNPqzYEdyEEy8irBi1+h6y0T465IgRNRDoU@vger.kernel.org
X-Gm-Message-State: AOJu0YyvhGXmErJsvwYL8SS5OokCwRf+0K5uWypWoSdTMncMH7UVDLdW
	W+meJN19+2uPdS58+3OB4IJ4XYJ5q/rupfawJZ89E7KGu877JpunTmtN1k3oQL++rssIx6nimxG
	bhpyWF9fjkmDvrCY9tTET1o62mZDao3Enxd2K7PgfFJFiY+y4LtGgvemK/6Z6iSft
X-Gm-Gg: AfdE7cnvLl2t7L/sB6Mk0GDKAhEfh+q1fwjOZ/P1dp+ujMHj61+nDp2uhLS47iRMQ+j
	/QoU/vb0IVeiDNc7kAlXR0kIA/oVVc6/HH+tZ/WLpGHXBp6XeYPeVXXYWMQvT4BTUOzd7F8qdt+
	NX473l5FwY8ZCGkqeRPWrkdeqNd9WbyohPvp3ZUfa9UYhAmvvF2QXd/5vi/O5wfOyCCEdIpw6WI
	M2YJ3EtZ7vrNZgr3oOg5/0byYUE+P96DCq7+J2SPt3mzIfrbh55Uzi6b1Ua5ZHoM56r5yXNmPbn
	ZsxLiaYCz2FEY51c82AXoxi4PYj28CBWcZWf4aU4+t6zAiGsMf/cwIVv+560Bp7+DDN2c5p5mKW
	q/pCFjcTFgDDSYafSI+QReMp+rcEDiAY=
X-Received: by 2002:a17:90a:da86:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38e3d21fc15mr11368431a91.13.1784379470472;
        Sat, 18 Jul 2026 05:57:50 -0700 (PDT)
X-Received: by 2002:a17:90a:da86:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38e3d21fc15mr11368421a91.13.1784379470025;
        Sat, 18 Jul 2026 05:57:50 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:49 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:21 +0530
Subject: [PATCH v6 14/16] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-14-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 5QnfrJ4BDaZRTuc8zfZCrU6aejME0Iy6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX8iSukJXPPwhr
 TT5VaDiXlv3x49OvxTkdfEMd0bDlpVZA4XH8eH3Fml/OJso2HOU42rZ/bi1pKOajSlsw/eU3kA1
 c3WCab7n2kA+9iG1gkf3AM1Qp6sHU8M=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5b784f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 5QnfrJ4BDaZRTuc8zfZCrU6aejME0Iy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX6uwkmxKVKCF6
 WoWRS9/tdniodYeDk/Ljo2AxLqYu73OS+T+blrCjCPbCmd7TMbrbTvjASsH0NIgvUcv383O1gwS
 gJqyS3EF+T7CK0kZv2kGW/SlxoceMaBpyXh+I3c1dHRSOL82CSh/MySBPEAJWRr+BJbGqYYofXI
 aI6Ya+bMZNpWbjy38fjK31SkQaqTdy1tiV5CcW035mUwZX1xQ0/dt1DVB2tWf+4+qI6aKmueVGF
 8N/mWyS8mN3uaLcecGRcnUS5y7dp8IAHPicT7ink89AgC01FZDGI4+ZYhiDzc8d3cN/q/9WnNE0
 YKC2VUoEnAScaiL8KWagA992F/rnqBGIDurNEWPaOLXpxySCOxWlZaWqA5rqIa4LdiQo/BkTs/S
 w3p1icwyK5Vfuaj6Z3ax0juo4egxAFSeG/ZLuQ4PEfWanfrnGzQzu/nv6oOydvbOmcpB2QnWKng
 oFYDoeXshrszYPXSx1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with same set of clocks and minor other differences.
Hence reuse the QCM2290 header file for Shikra and document the
Qualcomm Shikra GPUCC compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index bedbdabef67286afb6ce0a1ac53d1a9a15a01a92..ad2386190346cc10f53763e7c3b9fcb35fca8ed5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1

