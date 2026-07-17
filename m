Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D093F6C58
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289273; cv=none; b=SkTet8h+MpQnxgFvy6tvgp5/ImnlKSOEUONwkZnDkhdHgq3lnD7pa6J4lwznIVatFV6ke+s3IJewqQB5TuyjiJzsPKL/FG9++icSAl5fWbQr8ACS3li9N77k22Yx36N+8Gc6tZPLNcKow8+bHl6ZdR8bvytLGoX+Pq0O6Uz2fHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289273; c=relaxed/simple;
	bh=2peO1UzbCuiCWCfh5/yhDFVIhUsKbwIhtUGipgPIZ0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hr0dgQm5Ryk98kd35qL32AGOr3x/HPEiwonqN7+FzJI3Fs4sTUMZ/HeJMYsmujcYGhfY1eRxRdGjerw11xDHBbBr1uC156zybHgwU5V5Zwlw7/0Ord9lDAxqBv+M+ZSW/rqpzgwuuvH9420dykh9qGP06qapOVR924cQAQ1keh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7UUR+Oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9zsINft; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7UUR+Oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9zsINft"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASvAc1632093
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHgN3k7yEtvVmxJhHXt/vaaI6tULP6wgCXcb5yrgco4=; b=O7UUR+OqFzPV/p9N
	wkARkzPK9kF4APsxn2jj4bw4kezy9RR6XolJUh2jnypmr3W/Asf059BN9ir4vH4k
	D9D6Lzmr8C4FNGgldpyexyz9uKGvJqth7pCM7mwbu7rNBwJk0oc/tBolxUw4IYUm
	VocvkcYGcbioTa9oAWSUOP5eupz+XxFKtkRNipW9Rn9LHYh0d8GY/QbcKd7PH/eW
	JzwAjBxmKedRczAgNiD4cxesX6Dq0zpkAtIAKX+1EwifCBg/momZ+uDnYMSCQKoC
	4kxwkef1aYb+xke9UoIrI1skgREhIdiXe/n0Sxhr7vb1rEQX9vev3FQLe/tnNgI6
	ryNWlw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0usg61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf27789c79so18089065ad.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289267; x=1784894067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHgN3k7yEtvVmxJhHXt/vaaI6tULP6wgCXcb5yrgco4=;
        b=K9zsINftv0X/baiwOXtPF0b2pSV6Cgr86AZ7xI1aHNSLxs6QPLJ65ERmUul4E8u1e6
         0cf5U8fsta8TJPgZK9jfYqkJG5FGxzsys5jYGkuGkvRSNIQye/XCsBJtW9DxJ9CkpUog
         gSFh9hYw8TrMs42dSaFAM5GqFETgpZYUMqqXtY7Fs1MAKzt8Nu7Ksj0n3AxznUwSbgny
         9UxapRVN+3AvUoZroO6g/nlNy9TK+lCld4iwbV0GncvaS2N1Dp27lKOa8Tsc79tNHaY1
         B2umoDD9rD8+NBCjmUlZBj7vUCAq1wjiu9AAYMFf20ktT/LErmyBIR+VaoHo6cUrV1d8
         0FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289267; x=1784894067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHgN3k7yEtvVmxJhHXt/vaaI6tULP6wgCXcb5yrgco4=;
        b=Q9Ocs4qowqMQD/69nygCy9Ymq2U34g76IL6cABl1Ij+5KPSSFUVd/aa+ObxrCqq0gf
         ZqjEO+EXUWAFaNhJXwL36nQ34JCF+6sie6f706M+4acolnqfPZo1uxw9GuIT7q2UEpIa
         8WUa5JUmRJEnKn6D7L9iYXY3g1QSFMhB+CoebTvRzwYnAUaNyMkg6j2MOSX56PGz7DYr
         ZF29oE+y6OVrvVXGucmmQmJArkYbIbbVRgfbICCzvWfNJjWhKCOZZDjtecfQWvJZKPXL
         0Ul2I/oeAVlEUx1ijXnOV3KCjnBkv9S70vg4jL+F8ZJf+AsAbtLaOwpl4lJVMbZREPzV
         8vvw==
X-Forwarded-Encrypted: i=1; AHgh+RqMWDSPeu1ueakH1XYnLyJEQC01cdWZtVoqcpT9SxrME+lxOIsmvWo7F9iwSFHDREYuOkB+Dv6+czOR@vger.kernel.org
X-Gm-Message-State: AOJu0YwEij3RYlw1bU1xLLc+c0B+qRP//eV0wC1SZ51DkXzJD+g7wVKA
	gDzeo1dAmtJoYz6CYWTABNXnyAehkOPSVtUosTh1TVheaupDHrjwg1psFwRR+AFUrnaAIjzsxyN
	JeeZS4tpgA1EHMjRBfzYjB5AAtYmeii65CyfpLw927q8wepRz4cfQ3tg+PERvsTdGZCU3MzVRYt
	o=
X-Gm-Gg: AfdE7cmUIi+CYUWVrKEihMvpy5TEm8LFLatorhnEEWr8APKg91pmXfWwVpnJ7uj7W77
	Guow+K8agq2dUdidSIbWHHcmB0zvy7aHU0TEJp5+N1P72DikaLSMNzpH5vAxmjzQ6Rdoxy/Ifau
	ERWL9T9nKWOeuiUP7Aa6K1egRmhTRWbWrjpeEu6rukuXkyFfrf7U1R+B/Yv+Fg4U1TB6R5+pgf2
	SWZZYZRCByHFMBVI8Buyo5G7iH88FZWYGtRbt+y9HY43ac749HlxRNIYFdMgoAEK4h9MTDeN+U1
	t8CY8QNaHnzjbUxqDbZJ6Wc+OLH6ICsDNZDDD9J67m27ZBvdap38SN8XLhPwCIhwbql3hnjmWTI
	52RBKh82pRRCgVpel2bQquPNBpUhna3v8p4ykKV1YcambBndofoVrEkPJCfx8AI0x
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr23481225ad.32.1784289267074;
        Fri, 17 Jul 2026 04:54:27 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr23480925ad.32.1784289266603;
        Fri, 17 Jul 2026 04:54:26 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm9481895ad.31.2026.07.17.04.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:54:26 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 04:54:11 -0700
Subject: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289261; l=875;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=2peO1UzbCuiCWCfh5/yhDFVIhUsKbwIhtUGipgPIZ0A=;
 b=huZ2fCNG42gsfQCat0t97HckTjzfs6nImeiK0tPyUj3//uqohqYsVfyS0WHPnsMsdQiFuhhn9
 mDig0salrerCg1ToSSDSf0ZzqIryDIUB0kx9yz8wgLJmUKbh0dEQzQu
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a5a17f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Gf6kasYTCoD6TKqZ3V4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfXzxQEIOWv+Kuk
 dx09JdQBHU3+KbhRrzZe6aQ6v43rGcekVdWbXQGTOJLYrLAPf2a1PW+6qjy18OYp5/uP04ApjBy
 PnjNHSnkJom8FKdirnJfx5WDEXhlBuLRjqWoryH7bZoqS9iYQIYQvK2G7+KrjLRc79TWIg5jYkZ
 hHt5V/PejSQiYIpcmHRR8knulCEhoEuJr32HmBhUAqiXqm83qL6Tz5Q5VeL0GVX148RmRr97lPD
 m4LgWN01hqm7MLcs8nTwzzFJt4xVC/XRIFQRM/c6/tYH93DaVuPf8Uf4yC1f6kXFxEnIFzif1ha
 UJ2W9CZEmU/sqhkDXcfwzzpgPsNiwjqx7gVan9PKDfbzojHm6glW4OHcBKXTFbqoi6VljYvcOhg
 9JwJ2Dh2HQ/8w76kyyCtkVq5Ztb/Z88nhnWu9sEyzx1x/4k2gRNCSz3dyLO3rCQ8D05jtlOo9qD
 AxcjdLkiOU4gXuID7eg==
X-Proofpoint-ORIG-GUID: lGrLJl8VNqJWCFm3aaJZRBc9WZjdb2Yv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX11N0ogQAzDOA
 MmKmqgf/gYOAHoAC4v2sOiVZcjtzybQg6gFRrWU2BdTw+WOzeNANIQgtaxxTcg0HRualcO1/MhQ
 G5D1ffjjGt1GmjScEizfKQbRELbb3M0=
X-Proofpoint-GUID: lGrLJl8VNqJWCFm3aaJZRBc9WZjdb2Yv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170119

Add Glymur QCB board to the QSEECOM allowlist for enabling access to
efivars and uefi bootloader.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..e0ea40b4302c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2326,6 +2326,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
+	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },

-- 
2.34.1

