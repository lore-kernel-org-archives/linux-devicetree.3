Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B443B2FE6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260736; cv=none; b=LWEQT0Cmwd0e58xGm1qTqjCYozz6naNmO6OESLXcCi9c6Q8OZE3tiN744RLqVsmRVn+YCmHCkKULsSN2WQQUQ0TBzpopjP88c72jMXjxe3EYYKzeYuIzoDbGJq7gys6xFCVEeFkrI0DbGvTI3N1fXvXe/r1Dpj3RySy0zhRbi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260736; c=relaxed/simple;
	bh=gStEzvgs7NjI1ffvpOOKeWsN7W5iJqPLd8nE6UkcCAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhILpyrb+GsJQsX/9hjryVY5VcqD6wo+qvw8NIl2BYMz7GLnHnyJWlqTiWtFKt7st1iXss1BALRvY20MvzK5enfu/0H6HHoVm2kQTsEBD7U3HENiy6iTv0uTkvL8AVVPvSgdT8x5UkRSeUEPkLwd//HUFLnKe6HY8BNdZyXka94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yjr+DPBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnQpqIis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yjr+DPBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnQpqIis"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SHbgd63883679
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=; b=Yjr+DPBltEEFJbC1
	wHF7mS2LSw23CjS4bgXLm3+AdaaSq75u+CbOh2lqjFrjqyXNJRKIKY70N6e1P2ud
	RaKc+ZGvQsgO8DmuX2E5LXf8YBzqNf+8mvo9uFfm4qCSTgG5CnX6O5xWRBq5yQUW
	H+dxawAsVuQDv7TCSfluQhk3dOEyF0RwOsZrQTpurzlyqH1LR3wqL7Ha0MjcEJ4B
	+U86Eu37RXHj++c9wyI2IjGn7kWdKC8Z+CFItCGuo84RkAGVZ8kwq8mZwO11U13e
	o2C0YF0RKWPegEG2PZaKHJjg6BcWnvUFAUepiHYd5lBhulv+t4vI7tnhTRXjrBzM
	8pFA0Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108r13e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:45:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso102436a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260734; x=1785865534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=;
        b=FnQpqIisZZxdfHlN9AmlYzIQRgQBWuBQms+2++7r7cW0QCJrRZFyS7Y0xeiRBuPl1+
         nWfMn1ih7JbUnI+tUpdlS5uP796qbNKKwL8GYOwqi17AC2GT9tZDgMpy7EpAjbMaG5Rr
         oMTTnvpzPtW+dLZ0oY/t1GG131qe6ngNGZrME8HiGpfFr3t0wzIUxYKljQhJ6EDBBNmA
         riA2u542YaMqOqPD/GbX+f1BjT0qeKMuQETStH5GpDbQFTw34j8H6h6uHBwilMyBKWmM
         lTKMVBDLn2JVSsuB6rR9Bhzi8yuNeXF6yhodAzMNdfzJjghi+3kepKSuMNV8/A4vcauC
         kLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260734; x=1785865534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=;
        b=qHlz+P148iFgXTDeZ8uOQDHR0pg3yNE1V/PJhOGjG813xkH6TLsUQTP8vHrA3Oz5iP
         sZXzotN1NU9yHh2ZOkgP1TeTlDMLQcQJzXbdcTsNqqnn6FnM/yK4YKLPLp14xlEONyui
         Fq4kVMQzNwlGXEq80fjtv+YH+FKjFTDqc6v2XWoKXz383SmAJIZyVUZKDgXJwJ2l1e+L
         nGXQ0rioB08pnB6FsbcOoxBn+3S2fG6ry4otaf3vYbzqRo7WbhGLEHeORY5879JvHb5C
         RV4ilOwLpEFKg6wn/TMNRjoLqVUpxp1xBkc1XDEv3v0HzmJXxAr6YPH6abumKLoiQ04u
         TBrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrncVPlajSFq6VgWjBqcXqhb/pgAShnYalqsyJV60zRjmRrveB+vNaq5SFYlQq346MdTo1wmjIvA8ym@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXiz/Gmnq3ZirOCHiquj+DYD2oP+xBBan0q6pj0pOimwwEPl+
	rEqQ1TCV4lO5fMS/m3O3CSx1b5Ny4PqvSGfSTQgPTLrtYB04ohQHOY+ru4iDic2dmW5MEbCetdJ
	5xqlEMGUJJxWnJwxupqa7N1eS9jcMqB7oIlzxOwfmEtQ2Xoam6hKAApLWp3kW7BCb
X-Gm-Gg: AR+sD10VOdYiOOfWo6XakmEotShqeO9EA/RofKWmOVadOv0GzcwbqTLyIrxwth1vnDF
	wmafZ3o5LRfPJC/krmTKZKGjAxaOcd8IS7oVj7vF6eePD4YeMCKJvYN4ZyCgMUCLPbhTBz2S9hH
	b05wvckDHYQ1vTe/Q9fMMOFjcCLnJ5//SYAKmEYLr7UnP9pYbSaxNSRSeXK6QIaAlx/rQhX+PMr
	ZVrVDWmpQp2MeoeKoCt93nJvFc9L0K3zTeBWPy9Gt9hgU/8dTAFgUyBHeJr02WUAhLO0GCoHNpw
	JOV4rwCFoczQh67nv7BpwSMaHZPlrh5LadS4GiQEGLsjGY+zQiOzjmVV3x9qVNO5MC9RM60x1Ug
	3bHDcSPBN/DKV9aBcZAHwWA9QxCfrerk4qd98XX+IW3WSMgQTYch8HEekuUk0YlzZCnatpP3bHa
	bx0nIyt7rZe8MH
X-Received: by 2002:a17:90b:268d:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38f6a311026mr4103309a91.4.1785260734177;
        Tue, 28 Jul 2026 10:45:34 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38f6a311026mr4103283a91.4.1785260733774;
        Tue, 28 Jul 2026 10:45:33 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:33 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:33 +0530
Subject: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=998;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=gStEzvgs7NjI1ffvpOOKeWsN7W5iJqPLd8nE6UkcCAU=;
 b=4hRPZy16gtfLknzVZFnG3R0ewTlG4RYVkBHY4haPX+cv9BGYOjLpsuon29h/psfLt2/Cxy1GE
 sOLgGg9vkzHAvmQIQZ7PuNDLql4V0BlVlYREqPm3Fsf7ZpFGTnBSXMv
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: Z6JGAU2J-pdMl2NM6yKHZekoT_a8H6Mt
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a68eabe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rzEn2H2MjajWylKlqLQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Z6JGAU2J-pdMl2NM6yKHZekoT_a8H6Mt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX6i/Jk1kzhzKX
 gs9D17h2ht1A3jcHbVOH/CcNht4l14fkDsZF3X1wnV3gQtKsA0FUa7YpXTczU0LNfe2Awn6mdoF
 uU6AX4Xz3jOdW1MSFgOq0VBrLsf5ajQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXxLKyZEnYjnuN
 +8Q2qlWPiGlsGTMrlVGRVvCJeLq3klyyqThv6oKxkOwoBOnnifwUOOSHMdT3T1wRpc9krG8sOfQ
 1cr9NnENDIKFU3INwBrgzYRkULiEL4P8PwZRtsKwNWHSkI94XdxehnKwWUFkA5DeS2a6X4BgbvZ
 unlLSH82sLRjUK2HLZMKy01N8O1xfbCunoHihBKw8Y6KbsGu4z8JAiZ1taItgWJufngPEPwU7zR
 GKeuxLY5mxYSVIEutsXw41cMvzyZRG+1bFkqD1U8yFPPDP8U0XfR+I1Yu8v29zu6UrG+qGcAJ+b
 xWKDDSLULkwyPwJkHArr6pBh/VSKeRcuTZVm9/fy5aM3yEQI1Atj70/8aA5qIS3IFC+Kcia5ANQ
 ehCEQmTkyEZHXCebduUskHgsDiifGMSsjKSO5ykpqTkwV4xThOxBwwTBRhqFiDHqTxZvJRIVZIy
 DjIXPCk8xuS3N7SDFwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280156

Check the underlying I2C adapter supports both the raw I2C transfers
used by the fan RPM/LUT commands and the SMBus byte and block-write
transfers used by the other EC commands, and fail probe early with a
clear error if it doesn't.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index d0c45d9970ee..a420a180a194 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -1195,6 +1195,11 @@ static int qcom_ec_probe(struct i2c_client *client)
 	unsigned int i;
 	int ret;
 
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
+		return -EOPNOTSUPP;
+
 	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
 	if (!ec)
 		return -ENOMEM;

-- 
2.34.1

