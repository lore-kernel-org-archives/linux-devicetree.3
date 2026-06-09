Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EE33EFFA5
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996959; cv=none; b=fJWdZioxxcFt8okfG3MC2FFoJXyy+XPbkW7OM68F04sjgP49f16qC8TdRJpmBPE4n4Kd0P81DbyTbbiwclEHtx3TrrynndUGdrUODH8ZgSwTSSxW/CnFZmRVBFn7je36SAdVOj2I9ot+RU3PUJCH8kXxUHTNMC1G0o7+xctqVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996959; c=relaxed/simple;
	bh=xG08a9MtrfF7704OGVxEoz1UjpEo2LGi9XCFiUL2SuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulA91ImUZeYwJr1LFeEYvnegVS9i422DzMlMoQsa123qZ9jaIQLIf9ZxDNfzk5Pb8lk9mqp/III8hOuJNCNv/4ObrGvRnIuLGmghJUQcou9P+tZWw38X7zqKg3/hIBdhfzkyvKOvekdiuSFjaPz6cLbeVGNpxJoQ+3HXxBxcwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO0tuAye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HY649jom; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO0tuAye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HY649jom"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rN4x1584125
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jHu4UiP5358WASpNh0RxH8TEEZkSYnlkqWXIR0Ttzk=; b=RO0tuAyeNfT+2VBw
	vurr0qT4/5zljSNiQNKRBT0dBxYt0nEWUSFAFtHpuZyEBcq9ej6rbrGiEMifiGSd
	ghaIz6g3BPK+qXFAX38hKFqVF40cPDnG3LwdaSdCR1og3mqKfR5uWtOKJ7U8o0fI
	dBoIRca5+c1Kcq7UipJtt9zQUAa/h9u0MqsvFIBuQzkFav6hQWZ4HsJBy17Sxdi6
	Ad2xzMr9Lwadw2kiCefptADIseChHKrpARnujwiWKbQCZjVeO5LXG4x37gA0d9mL
	jUGKW2ISqawda4XugiWPB/x6jjSg2CsTRrcLuqw9UMlqBIVYZWQ/fY6jxyR9U3vp
	XFhbxg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeerrq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:22:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842308adb3bso7202168b3a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996956; x=1781601756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jHu4UiP5358WASpNh0RxH8TEEZkSYnlkqWXIR0Ttzk=;
        b=HY649jom/DFBNHRPsNnHK7xmo6xiGe3CcANnnPJkxxTa4DzauRKEHlncJjeKb0kyes
         QF/xjm7KYzVwVrGBb95u6uN10jXz9N1PfMUBDkF+OS+Dx1R8tyZ7xP39xN3Wy6xCwDqu
         KR9nocl93dkL0WayuEgC4tXVJlSTn/6nYCSJgt6QOjaBiVN4Q1sOdlGgXsx9iVuFNpCY
         QDE65LZNu8HReyEQaK86tUKRydccS6Khn6Wo5boQjmzUgqSEYRUeFMoBxsxgZgTTI+nI
         jvdOMTNqeN7YLkzfpum48QgqWXBFXFQLWw/r+gSRSo3uIDGLD3OpVqqE+rf3xuKRotb/
         Q/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996956; x=1781601756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jHu4UiP5358WASpNh0RxH8TEEZkSYnlkqWXIR0Ttzk=;
        b=lictbTXD5K84P6Sl3V5iyk6a4mAdrNKU4WZk3Cza2osBWfn3baIMrLdFbdE+7Vv6O7
         EHT9m/3lqB1PTyp/0Ouau4hx3bgajlYfsFWfwVZUUT5ZW3Qtdu1IaxaVRKYoE43xTPgw
         qp9nHg37C8ADixI85t5NyBiSaRviQJFg34SI/APwQkkQRg4jW+R1mYs1aU74shvhkNqY
         tUbRdAIRgOVdpd3Q34FFSR6cKt1Bfkd2W5Br0FKi4YbufvXKldTMnAvR1IlgkW0GshSl
         4SMQ2u6zzQdKCqHQ4uNXr2+YUusOnCX7hHw8IDMD5p3Jd4r1JHZ+iLoTV0C+huyiJSMC
         exjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jRYeexYeTXF5XdJtM07xEClm1I1LxI6PHfYVLWWYeUu1PujSJADcBzAqqXMfLtUFiU5okJ4HXyCGn@vger.kernel.org
X-Gm-Message-State: AOJu0YwJngHhti9QSI1Q5lXKIMkiWuAeix6z0480diJ0mqK1KknCnNXK
	hwiDfo5w+PwtgROwQ1OHoEhfCZRtMsqaEImJaYANf6SYSbw8DEleUQ5MKsBJar0z2ihmvhQdOtY
	xhP+j2y02sW9Z8149h3x7L8pDKTXsY7T3Rn5S8KDNtc31lSONb1+J2J3IgG2GAJEg
X-Gm-Gg: Acq92OF+QXOfJBiXr9Rw72D7ATD1iPcDWr1IkeCir86lE5i25BRxXx+MNbpXeoR0aU9
	Mp2veBtVF/xd/GLpVf0nqzLzDTiVs/aXlRraXZFOmun5aCvwI37rW5mNxEn/s+DaU/JZP0BMSt3
	F0A3slAHbnlj1KzYcxzullZm/diX6Z1jTwJ8NbX2GfMHgI2b3X1BVqDbak0FQRl+kpWZ50bL76s
	P3Q7ugT/rZXZRpKGfc/v8rBv4MjLTSi88N+9tUxydKnHt5oz3yx+MdUQwRq71IL/XNFRHfN+JP4
	NPajWZdgvEp6DQE3s+9kZkK6hE/ECiqYGozQASh0iKve+i9Xz9r2XRBiROJna/vuQw8yDWNv/+1
	IgzXoZrQuqyvGppoLkTqFl0dfuBCbIljSWW8ffnGDG6AhEv+53PfbiWZBSv4g3Z0EEkKGTwkpiN
	fVn4AvM4kQ+QOOB/M++40Aut3A/sR5M/WUTdpYq31EIdKiQ5HymRRHFDoxJB21Uw==
X-Received: by 2002:a05:6a00:1302:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-842b0f9c4abmr20018130b3a.34.1780996956030;
        Tue, 09 Jun 2026 02:22:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1302:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-842b0f9c4abmr20018101b3a.34.1780996955623;
        Tue, 09 Jun 2026 02:22:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm22861582b3a.30.2026.06.09.02.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:22:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 14:52:12 +0530
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-pcie-phy-v2-1-83bc80e79fa6@oss.qualcomm.com>
References: <20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com>
In-Reply-To: <20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27db5c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NiBTYWx0ZWRfXyhYg0QEH08oQ
 dSymrFB48Py6Kydbha+ML7t8c8IxEjhLVZfpAfsPiynC/kLsymB7+4UEZrMKyEfZ+GX/F27ggqT
 j+1GS89zVSje6YNygbj0YwRO8hNEuNvxIcwSMAqw5TaeKcKCGxsK5OdFiy3DIO1Fi0WCRlJiDsB
 cQVkcaOasCRElSctKQz6OGXmWIDxODGP9ctC/Z2sdyHo2JAsWk8Cs3NV+9HHiRkJwjqNsWkR7Fl
 fBObHe5fZEYyNTC3S4a6nD9pERNBcbqxpoHHGzlWEwnB9J4YmX4tVaex7iGdibB2QddFgEY7sJJ
 lWfEjTdFb0mZMFb1LUS2rClBn73S6zGGpWkVPsBf6RbU0vqJF9zDUw9VpuPtagOksD3zETiMe+V
 mgP9Ka7UI9vJFqjBTS1gN65/RMKecpYwLocVM3HwfM7VFgKRC977hi3pMRfM3vXLi4JSOnbwc0U
 g3EtLMPNta/a2oDJ/3g==
X-Proofpoint-ORIG-GUID: PSHaLE9WVEwc4MGxrv1GFdld-lZg6RcT
X-Proofpoint-GUID: PSHaLE9WVEwc4MGxrv1GFdld-lZg6RcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090086

Document the PCIe phys on the ipq5210 platform. The 2 lane phy uses the
ipq9574 as fallback. The single lane phy is documented separately.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..fc155ad5fa6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -28,6 +29,7 @@ properties:
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1

