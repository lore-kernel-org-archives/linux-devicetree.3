Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC439448394
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109430; cv=none; b=EByHIzT+ZFsWVAF9xWLPKSRalOy+Xorm1xzyF2coPk15O06WBRqOf/+/6VXyZDpEJje/t1X0ExAoWggotfoOvvMNUqbFZxqCx/F+2YwdBJi2tjHEEjgH3/d1+owVQk/le7aktfooVzjGK1squLNn8HLWIJwuy8QWiXubqGqlemY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109430; c=relaxed/simple;
	bh=8l9FICuqx3xAftYZuCNBhQ0tO0pyXUYeoBsSa7D/2xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+QfBpvbaRL9KBkOtjNA+uMEoVsvocPbKtCzApj/e8ci8HGzf6UA7l/+yNzkVPoVSHxdLaRJgLak3vEhvgwFLJJix6FGnExwGhhypHKAOdHkeruVSk51wDWS/g5DiZ/XwPKZH8NlzGjuhMZxNJTNGeY2EpYeket/TBw/K5ANOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6DJEGwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBzS7VUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6DJEGwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBzS7VUX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kLqN3328875
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spdGKKG4qxCKzWR+xjzpziPJrGgmzLs9adPYdCYRT3A=; b=O6DJEGwTehAljadQ
	kALDcn9OkSESpJKrLF1P2sgW1oO20gQvhteR9S1hbAnZSlI1vLEM/gqXjPXNbrDy
	eT7tZ4Q9MDPQZ3je+yPsFAZBvv6T1FiS3AXct5Cz3rLy/DbaflFghozMA8oic6Yc
	2PWayjP4ie84CXxjUJpe156hgg3UPrSZHIo6SY9rWCFeZaWvZ4wHhYmGF/RySvzs
	UgKxuy+V5Ibs8el59cUkzAYaj52SxBFSL3XJbNB/JQDThZE22LKV11xa0BQb9cBM
	LHp0Phrw1LB8NX6pphxdrDNWy/9VEmj4WVExu+QAUZ+YkcDCsJMpmHmR5iBsJsoT
	lpfFzg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr8ar8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso742499a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109418; x=1789714218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spdGKKG4qxCKzWR+xjzpziPJrGgmzLs9adPYdCYRT3A=;
        b=eBzS7VUXsyilltvltyh1rEijWPHUYfln+YohogKTncex9aiZxM8E5nlShzjfvtdTKu
         hL7jK0ZpGzt4b+u+3Dzg5RxoZFLmKN44cdIax/8QdNVuLa7pKyaGX5na+CWLeLI4D/tL
         mbr8QrXHhk9MivsuLwjSkuiqeFSvKNIiyXgfaCtgT7XBN9ZmginoE1193F4tOzpXfLyV
         plaeKMBdd3hkQbxf0JLUSRoN78PLIvkI4P6F5+wubyuWheLfRngew5MmZMpY0P53TsAy
         sYghiLsv0SC34BujgT4tmonD8Yz9Rd9JkSRdSo50V7CvDAQIyaWWMgrwwymuxfrT5v+r
         Kwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109418; x=1789714218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spdGKKG4qxCKzWR+xjzpziPJrGgmzLs9adPYdCYRT3A=;
        b=DG9m26fzUntFwk6xCpIe0VH7t4SjvYY8C9ha3dW5zFMS7DLvsxO06napoD5DSVcMW+
         beFK/7Byc1oyQeHjHYGfbtXs7IwSjWEgJsqZuqtEsklHwlvYaz0NJP3qWb3SbZaq+YYw
         cJktMP8YxAzDRwFnQ9fZdiv5dF2jQfBULj30J2+iKyBhh15nk3Cf5MvlNZhoncJ/BEGR
         oD1UTDYj70Yz9RWqo00bP3EhXwuq6+kAQgptHyRhHT4oVtMknnibVrKJWBsiIVpM9ja0
         fSWlQxgQFBdPghcaaJ3SJfztMrBnmqQYXlvO+2IlVLOUHpkRlrqoI55NGB2ADvQB+1vC
         RPJg==
X-Forwarded-Encrypted: i=1; AKwUvByi6iZFTgoTzBmz3CKV0dqhjsAOKcwi97ymVniFlQW6R1odlHGMQs1AVpEenyBSlygTSem/MG10GlSp@vger.kernel.org
X-Gm-Message-State: AFuF++mch61IhmPXzi99JWKdCDviycHPeJg640fI7pft/T2Aqu/r9kHR
	9U3PH+Bk1KgUxg31+QxtinPVE5IRZfN2oQDV41lYpXb+Ry22e7qaMPyVTbvH5H6nc6SKDLNTkZz
	Sph8B+fishv21erH9ibF+Da0j7BP4O85hK7O3aJ7AhNzzBCcd8SL0OGk3V7Jxk2c2
X-Gm-Gg: AYBFou2xWCM33f4eC7mUqn7zUpA8UVi+4TzucR5572Rj0s/+lM6yUUZKQwp85BqgcF0
	GOMPbT2+oXog3o4+4JCtr56c8bY2+Na8EFtfLaHpRSO/qNkszu/Fr3YU/ANWzt3AAJ7qyOOKGY9
	eHZG0DkTvw4grfsbXjDIxU3hn55kAhMAB0iWT4jZ7c//shoxlSkQ9dtnurL/MU1iq7mGhNovPRl
	D94ZFm1QBwSYeschctwpwDOhtYDips8x1bAhEN97Vzx+hDlVE61/VY5+RzIYlv7b0jtdkRsxsQK
	140Sd5YkZqH7WErc1YnK9M7Y0mJeOjuZqli4IJ/IFuNs60iXtZ4CcFsQmOSB7D6b2hSFlfKy2Ki
	No8G0yOR5pCbvAOm1ieVBpXjpLxGkDwH+4SI=
X-Received: by 2002:a17:90b:2dc1:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39d9c21b2f4mr4360371a91.17.1789109418116;
        Thu, 10 Sep 2026 23:50:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39d9c21b2f4mr4360337a91.17.1789109417662;
        Thu, 10 Sep 2026 23:50:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:03 +0530
Subject: [PATCH 2/8] arm64: dts: qcom: lemans: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-2-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=958;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8l9FICuqx3xAftYZuCNBhQ0tO0pyXUYeoBsSa7D/2xU=;
 b=X+8s4Ze+TUzWl5vGDj0hfj1xnJRFejwe8GWwH8iWSFJA+kYTDEOHM3RiVyaY5N7izFY0kubQg
 gJET0qvdblJAaaxxZqFwHIhILbKNWBX2XBVBI7xWsqwNMqASu3dWRZK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: VMSl03sOTcG_OVFNlWzrdDKysIGzUnFX
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3a4ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VMSl03sOTcG_OVFNlWzrdDKysIGzUnFX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXw8JfP18yfr2Y
 bi0es5KMgVx02IjorR2Aiy11xJC4iqExbTf5jkj9ZJcq3tJ9JiiKre+Wl3pHulzO4YG2RYX9nqb
 c6pi+2ER3vAmnFP/NO7tOJo7fGfy9WM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXxItBm28xqkZt
 Nlwy8sSscaIxJMf5hvvQ88OsRlq+maYhaaWiyVpgABneYDU6yERXa6dhq3Xf/UHqECsyvnLxSzj
 Tgiy8q4RocBiLKiVKRN/TRDOLMvLVPTidnP2ul8pt4X/JSazNPr76jQlBXSeZoFQhSblMHLjsqQ
 A2S4AFMVtma2RdQhVxTQwh1qL04Quv8oudy0S7M/rfENMNPvYmjQ4Gukmp4D5gMg75aP8eKyhH+
 BRHu9RtJGX/ZOL3yvjtMlhSrs9fyKliKJsZ7N1WW4f3+V+3BpAG7Yrw6HHZznPvP4SE0GLfgX7z
 qflg7nZKLAAdAhqK1LLLH+cqfA0ejDhr7hGdv3Ib4l8iGr7/2hgxfgN2N0M/txcul5bqGS1FKxh
 RpJSSJXQO24Y1OzRUEsI9MTkvn3xMJO6Jy3UHgjpYso1syGi5PUs7r6a0CQtn+D/Ts2edj8W87F
 JF/yJ2LTZpSL32py+VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..615a9bfda237 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2770,6 +2770,8 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2943,6 +2945,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

