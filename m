Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F3421A08
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655206; cv=none; b=h4EDPifpNBbYQJIT2oQOUQDdBuCdNzKeu5Q05Js0T7OQK+gUIlZQh5NMNwNYRZFN7QXngurv/nFKQG9HOWt/ZuuWl1Fu9nm/7ezmiJbEwoPMEemmbytnSkij4+6vFTpEXMf8egWmkgY8Jveb0BGkQldsLDftwk4tcaTD0mQfi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655206; c=relaxed/simple;
	bh=doFJzNLDHQmlXc2pfwFDlVaTkV7lTXB8yqsy53flfY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q168UkjvmRaT167xE/nlsktcL1PLnxatijurRE+uW2Q+YfPNUqkx30dAQNa3b3ekBTsC17vO2nVX0xjWrAta2PxwoEWS0YriY3G/PXSXnzAGgbQLrTx04XsZN3upNbXxDmvqo8pbTG12vkGuFQL1+sNeuJBX33q0Gq6C0GSk9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHWvmU+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBJIreje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHWvmU+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBJIreje"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLZib497935
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j0RJQKr0tEf
	FrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=; b=bHWvmU+jo6wB4u2LZnytLFvHm85
	6RSn3bSkaFiQZrJL8EUpQKSOYW0nP/+za3Xyh1OjrX0GZ2+/3NWT1CBcgRiyaW3H
	IgksOJ9c7TU1Ej4fbxdlxHUbjPLA0jCi2eXX68DHOfsGpZ+WXwp9nGQK6DOZFlkB
	UxQEByIq+MiUl6H7Hc/4Kdia9rFzRleTXlAoz5OcUIVFo+MIHC0E5dUKjdkhBvdw
	hgRqCoG0GccDnab17rlWuf8ckfyY/93iDN/CWDdyzoPe0YcvodSkVrwzWZqJNPvk
	4F0Vvj1j+m6WgoeLIl1pufG7drOnxQpNbb5+vlTeorOiKCKEl2H05LPRhRw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchkbc2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:06:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so3236655eec.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655202; x=1778260002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0RJQKr0tEfFrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=;
        b=WBJIrejealST25MRBMzniO6s7UXF5KfDfAEHF64EmXijJV37WawNlm6ac5xGIwegVH
         gYRRS1xk5hJV/TazjCT8T+wndvpn+byE27QSUMN/CzFL9zOS0W0awEndUkfoxPCrlrUn
         FwDVNCWU8Juyd7Sn/HNBT+MMFZcQfZ6wXbXBmFGC9nC05LlAEG0/5w9RE+ZDiYYXm4Rg
         YnGJgzFCl/i75v4HF7E2AIYHa8zzbEiqRb10yWbDyfPQK4N3fmkxjzF5vYBUrotkW4vL
         0ndZxGci6UU/yjJne8+MzM4iBopcWq2sum4yk7IqhXV820MbviIXWXA8YAM4bVZkIaBt
         qT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655202; x=1778260002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0RJQKr0tEfFrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=;
        b=SPtd70Y/FODVrbnncQD0b1jE+spMqqgrdNPjsoxVKivfJ7ZcD+mNuTSfCwd5OUb+87
         8jTBwBLXbHK1dAUqCKBCZdZQoyeLPFxaYxzOeDAJINJQEBaLVukDIhXDQRqzGGjfCgoZ
         aLOBSbnhg89msfIbpe+7lhaIMHewDgqvdQynlBh5CWRvdsXImBqZHqZx9heVSn01E8rz
         uYu8oQbxVpbSmXDfMi7Xyabt/TAyFEFg2kEfoaeFmWbax1xgm31om7HgCEfp1hMUp4f3
         RuMnzFcJNJTM2tMlXsAqmbUN1vNEWAZTLneBa6i73iVZ7XpJsDvkdA70Nj7LkYMpvrXt
         BlJA==
X-Forwarded-Encrypted: i=1; AFNElJ/OTLoQyBYhlMrtC76ATn3XDfTxuey5rkqhShnMGGuDuOjoX7IpXACuTecqkY8Qdzzf0xXuk7GLeCsN@vger.kernel.org
X-Gm-Message-State: AOJu0YxttvHoeLVWXXZV5KkPr+i0ttYPu600BNtWV3P4q89kjo09ZLO7
	4OxsHql6L6ZkaKsIHTrioICKcNHdf9/FlFu6HHpci2XNjZOIipz+IQX4Cl7BeTjh9YDNxs7rfCO
	09KkTXkZr20ddDcazxUPGpfKSnTH8248DbyK2KodcYOtV2gfOq/wMAb3x1tHnvKek
X-Gm-Gg: AeBDievDL783Opm3YZEuAuybv3NDRfJ9spk3TpZ+Hyi9ovekpkfpzekVf5etJcnMN3f
	qnnXC2Kkz7H2RNsXdYG+AbBZbZGV26r8oczNIOwdQ9ASaSCX20Vo2XUnn9kPd49z7d1YxI8ojpZ
	D6SfoWyO9M9X+oW2gNpOgOSItWao66+FBq7SjZpJHGHyGBZ4FjWIOYqUmOmVCVt+70nGpTgDvW6
	t6cWdVUuIWFfkKRWfQMQbDkCUxy2g7PgCix7WqNc9w8c+bN+l7OwLR5aRW5lbgvYq6aladZcFz5
	gd4u1mwugy7gjah+VrthQmINxp31VtTGdrE79LS9nktKiSpxJIVZgNLPF+WMpZhHBXYMtYwy8Wu
	O2vavIWXhVfPaGgfB68u838OlflbNhylDPyFoGSotBzHnN4DLm7nzMJrJZVw4qgVUTIYplofpoU
	7ItUmtKFttHA==
X-Received: by 2002:a05:7300:a14b:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2efbaca2796mr85843eec.22.1777655202305;
        Fri, 01 May 2026 10:06:42 -0700 (PDT)
X-Received: by 2002:a05:7300:a14b:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2efbaca2796mr85821eec.22.1777655201800;
        Fri, 01 May 2026 10:06:41 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:41 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Fri,  1 May 2026 10:06:31 -0700
Message-Id: <20260501170635.2641748-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX6r4uPwZHIKrb
 55Ci3zLEPP6fVDZ9sJB2jTogSaf2CjVYSL9NpyiAR5DB1+MxK+Y/aKc7OUUC8rv9Bo3L6PZKQs0
 8Dkv8uJC3xWp3lyfZb5HzDPTwRz+gxemOMQUYzd/ZSFJ4ogQOcyOegoh8hF/GZF6KcUr6wnL8oF
 SH1j59PoqDXSx9rU83aIBUEJQuZy8p7cC3F/lY72asNYoGhwPcwbZygHwBWRAiK8pA5Lu2K5rnq
 btIMMBEvF9QVFbpzuILreRqGFe20/VkcaxvebA7JAT7Sh+2woD/ZfcUY4ACUIbyfbp73cH/5bKc
 lc4hXOD6pjZBxoDpsyU+uu0GlZkN5r30kE/zN322+UyYryN67oRN3rXA7QAwZH9ARq6MErHZrVG
 i5OT7FvzfhYB9TDndM+IW8r9jjw1HYXiHhw1/x1l5RxVGgvlCvc/saKta+rkTOcGuutbJ3wul3e
 9U9u6qRvYvun08tWtDA==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f4dda3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=iEam2xx7WbKG8qDqzoQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: PYIEeNuXSMkuPXPl9K3OkykIJGRFv-Es
X-Proofpoint-GUID: PYIEeNuXSMkuPXPl9K3OkykIJGRFv-Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 7fbb74bf1599..f656ffc8818a 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

