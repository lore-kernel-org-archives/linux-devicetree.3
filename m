Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527029;
	b=SW2XAPjipzZD02S/qKeSztyxR96yocXllvndzufnnRSzRyw8lLrQ5y7VEj9xfPRg/ObD
	 /+Lfiq6LqxuYCmGvWT1mL1/5GIK8aeexwwc3jlD03gjvb+pEM6NGf6rKN3TrfjtNzVMKu
	 Pp9UYQ8hNUwJRvtEDuViMhmAZEqusTsxRPQI/08KtujGA7xKNq/0izd7Mz4r/IS/W4QDX
	 ssaCSPudvOwMocnZzqzRpqgJS9Hub8DI6s02WumPleTxNaGasu1gotLHa8DedTv7uSIX8
	 eJrvyTdWhEguZ6EteMeDnjN42a2tzvwzO4wjBk44S1GXNLICVs7tV4Z0jez1LijdbCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
	b=mWn7mAqTaJp3y31KrZAzjO7yLF/bXFcGd+77iDz1pqaUgr+SlDIJK/E6VtkcLh6UwJWh
	 Z+d9K/g6JeHGQsolhf6qi4R6frvFrphn+zTXTOTxrd92rwzrzgNTnDtloqJsfctwC+6bk
	 w7rwY9CTt9rumKH157zKgElTIZh/reoobyy/tqLa+5oqRlSNNQUfMeHRJ038INVah7vI+
	 APDM9uC8p1f4Zx2g+/XUBx53zwSAzl7w+6f3pGYfwyLit/6W7nIh5PN8B8/L9rg7JsK+g
	 yQVFgKxsGOO1VAj0l9XZOXPOlhxxN5Cea2WJZzHMsYBYdEB9pQn3pfhFJiYYR9I7Jzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RJnoOyXv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XmsS5wS9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD93606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFD93606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RJnoOyXv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XmsS5wS9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuibW1291480
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kwhDsvnO/o8qcFU8scAsqJ
	nEmyOdONiJiRn/s9wT6pA=; b=RJnoOyXvdvN3AmcUH2C3QzCBXAvrSdLfkYfbw3
	zluG3moIUTe92tkhtWQAQYqj3nxA41sevfTM8Y7n06cckyTGsA/StYeICrLmfLe3
	mPFfmDI7Eif/dNTS26sahHEU4IaEAHm9ybz05y3Ag27zazdQIWpcxuR9yr34Wj4f
	lgXhuQIO9EbxsJbpHOj1xSFWkl5mVm4JqQHoU/Sp8g3QzYWbnd0Kr+pEd1n09UEV
	w0ehyjqh0B9XqSKRUEVJuISMvZRIZQTX2P8la3PN88o9M0Bb6PBz9VsRcYZ7MRiI
	Cc4PGXj2pYjv2qOUPHjU+7aQkL80df1ui4ftxt8rWlmdr93A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbyhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:28 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4f87a6128so1705917b3.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527027; x=1796131827; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
        b=XmsS5wS94YogEFkc/JC8pHtD4f1aeDirWO1mSWk+5NSKcqrsrTVXUof6sMMDzOG+HF
         d20uM7e9eVDUO6UqsMFl9U/e8Q6fJiXuUlMhmOovR4W61vwwZuMZyodMSkDCF2VdqoHW
         pEK2PCRwgGydXzl0BFYT0lFXBeoSpuOLIhSxjHhToHf6Xgz9iVESmAjQZB5tuFz1iwaS
         YUcAJCoYvz7ccgOkxsvznWtZQjFBIYOgaMFzxvTzqafstTat536bJTEcJKCEjWIyap8i
         vUrjjL//ENKI7hFsQLZlcmVX4QXrPBgnrbUTbHi91BYS0482DLFcqq/L/cE6B97rR5Dw
         ehLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527027; x=1796131827;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwhDsvnO/o8qcFU8scAsqJnEmyOdONiJiRn/s9wT6pA=;
        b=dzO5hqossFyg8pbBHF6Q2AObcuDCXxmadMvF0EvdsN0Lx3DtuV+KxlWrBm5TAcPRG6
         jFuaNZB6CDmjQjfJJL81etAXdfy+Ou4520mHbwn3u4Yf4rP7MOPYhGwnxksuD39YhuZi
         g4tCB8k5ufo+zSjiHrz/1IhqUgOCouyjfKj7ZM94dhVAwbj1QKjmOwQ+8J/xeUeWb8L1
         8BBpMvk4VWAOaxroDOE1Jnghfcx06kXTtD3HFt8wBvJOdR4v8Kf/sQ+BJSVRv7G0bdPI
         OQpxzBp+crpv5GDhtnbXQIGOgY3cbyXcxt8CTbWt4+Y31k6jWCtbPdF2kqEsk8Urn3v9
         18cw==
X-Forwarded-Encrypted: i=1; AL+hErEoqb7qjh2c62wMqJkudzJOW7u1SbWuqYclolj9c/Uv+DEc+PzgXQ1675/La6Wfg2mC8GEZ09dPKVeb@vger.kernel.org
X-Gm-Message-State: APuU4Z83LUT0MJzLFz8Vcb7YhQFb4htIWS2j7ztLdoZswDASLW3H8Nez
	8uYe8CVvXqUyCOnnlLcgp/KSlVLh03HwZBsEv7S5Esi70QdZPOaZuax3GgekYJg+CVCjdAn8xvs
	KxpbziADU3PseRiiiMT/8Zq2Fhb7vtTlhQFGRYeL7Hh4721E7ASIZqD4IVYZqiV78
X-Gm-Gg: AZFdTZf7uAnghZjuKZLqCXIyHKNWpV0IbjcF3TD009WuBjDW7xADC/jfz3wQvbA45mA
	Ig/Fo1kS3HvM8BSLldyxrDi9icxEfYZOkCswusp42orI8/R9YhgVLGfhx3ci8bNU5VWn8jnLpM3
	r0+PuIEp95lRz43pFRV4DxbvYau/VTHKMXCSdSNudaq24bpdk0ot/w2OWPp51vd6VQ2XxhTzEwK
	9N9NjdidPg+MK1m2t2dYpYFSzR5nMeiZHjR2o61vbn21eYnbCKvDxGFKWpuK2QFCmtDP3J0ONyG
	sMcvIRdhUJjeIBRhQrKQ4BKbtgOBf3yXalVmGsa3rdJfQJ/h9jNX1kmMt+zVObbFZlorAUyMG6f
	j2o6/LWV+xOgz4ygJB5zRRL2Ha1r9toYlU5SgmJl4h19bXNjiliphfnJVKDuzmPb8yHQwDjMo6B
	UoRvH9Xz0=
X-Received: by 2002:a05:690c:4006:b0:8b1:beba:bd5b with SMTP id 00721157ae682-8b5204d9c46mr90521497b3.2.1795527025336;
        Tue, 24 Nov 2026 05:30:25 -0800 (PST)
X-Received: by 2002:a05:690c:4006:b0:8b1:beba:bd5b with SMTP id 00721157ae682-8b5204d9c46mr90520817b3.2.1795527024381;
        Tue, 24 Nov 2026 05:30:24 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:23 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 0/3] SC8280XP USB4 clock fixups
Date: Tue, 24 Nov 2026 14:30:15 +0100
Message-Id: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGeRBWsC/yXMywqDMBBA0V+RWRtIUl/0V0Qkj2mdtmjIaBHEf
 zfq8izu3YAxEjI8sw0i/olpGhNUnoEbzPhGQT4ZtNSVUroQ8xTIiUY3sl/YFr37fVlU5UPW1nh
 vjYGUhogvWq9t293mxX7QzecL9v0AxLgVk3gAAAA=
X-Change-ID: 20261124-topic-8280_usb4_clks-65307baddbaa
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=882;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=fAEcrKvCtRTvsoA/LdfvhqS9SoTGc0oxmz4TVXpFLfQ=;
 b=sUVSEdiW6LW3cEX5GTNTsan8jIqLwtf0zAxRZWKSFh5Y01XN+RFklBSDnkrRLGyUT1SMOC9I8
 WauilzOzb2zAdNtRPW5Cmcg0b5mZZEEp7cXdmBw+6IF/UsLcZpa5C8e
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX0cY2zq0w076K
 0fge3nlYAuXkSWSKFcxqpCbMIn9sSZf7NCv8x8pXdeQOTI1gd5LqiAIjHUt9hp5rsbcQyZNiTid
 ePTGET0vF7X0EyLqy03rJZFMwdE/EJ4=
X-Proofpoint-ORIG-GUID: BdbRD3hEsDjCnCB24CzAPERbOEivwIko
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b059174 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pt43vheFiXy_iBxo0bYA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX5b1ywTuyeRUv
 B+dnifcbQ60FE8QaDnwFQHeMcG/6HtonwM3zOcOwjt9fEmTjcIsSRbCcNDkLf9ol5hLSLUH+GYE
 Cyi65VMaLp9cPb2taZaMspSUUQl0ybUhso1LaMkNVRan+06Ezjlq+Ww0jAz9OIfEAFScDnBvysE
 2cnW9YDQN/6EKhp5QipWU3Y2ekB5TrlnVKe1BvkVZ+d8x5xPDlW0X8r/Urtflzay6B/kW/vixph
 CiN8BjwnBfZTuhgaKboKVM9V7gTvDwG17mqZto//3j7CI76qMfsFAUDp7oH9QyV1TEiTJpbnZZQ
 SmZf+F+G4DmcprnuV6q7SUluCy/pr7UXWx9huoEyyaAqfdwCGMgySiLhm3YMINn4NCS+RrZu5Ai
 Plj/MnF+dldQ7l7qytNOARCEAdoV8EbmY2qciye7g7OGcPw5fjxWdsgSs++49KE0jj3Ra2oVcWJ
 LXEFg7NbsDNznkqqYwA==
X-Proofpoint-GUID: BdbRD3hEsDjCnCB24CzAPERbOEivwIko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240052

This is an echo of the Glymur series [1] for SC8280XP, as it has the
same issues. Not validated on hw, but matches the docs.

https://lore.kernel.org/linux-arm-msm/20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom,gcc-sc8280xp: Add USB4 MISC resets
      clk: qcom: gcc-sc8280xp: Describe USB4 MISC resets
      clk: qcom: gcc-sc8280xp: Keep USB4 uC memory powered

 drivers/clk/qcom/gcc-sc8280xp.c               | 27 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 20 ++++++++++++++++++++
 2 files changed, 47 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261124-topic-8280_usb4_clks-65307baddbaa

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

