Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA5480957
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845698; cv=none; b=W4Zc2uahfm/Uh0RjD+D7DjenFfGt0BxmB3ecWU6OAVnthrVeWuSdqpFyYgza7IjKOgNG0wc3BqDdrhRxL1NUMXWOy/wRDPtr8SM8XnFAzUo9H5xeA59XYe306hsHulSuoLaLyRItIXaGD6RVxYjmhVawrpPAPlcKbYxaOF+2pKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845698; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHHQHnWXVdUfr06JBB+SDjuiDBodGPM1Eex9OPFcPZMlzvleo0N3+KGojvEgA7MjLPbROZV4Tn8igq6MyEQ10lVtlKPnaFMuMCRz41MHDHuVKHlpFylHaEfChL0dB1H0uo8LzzaA18Z66Q1BKqmiuLv3zRa9ZKk7IEiN6L7XIrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Km2GzmLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/rLlpkf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Km2GzmLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/rLlpkf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9HdPj1714936
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=Km2GzmLupUZxciT/
	3uy+vsBxHJpfUa8Txvx2jz1eZkOZSfu6ff6mIAX2Ljn6Rkg5jlE5JCaNkj9HNRxp
	vJ4tKIbmbmmZIiZsjEvMiqe/xp7NPFVOGj7upo2IxtKnwXsgwEVicg1VFcJ8pnOu
	a8WGCPsLeNOz29+NGPFRZJjZTWqJ1wOO+mcGlntWbD30bZM4P/AMHFDZYZcyliay
	rFlThivkXDCkSBogBSy7c0gGrsr6OtJ0zC9d5sAWibio2GV6uuBQf5VPiwTwBjcC
	pS8S0xWZUq4KnNtpA9Pg9Nr1Uk7idta9dn3BD54xQiF0AWAqP6OMI7+qItLRumYL
	sNWQzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsvfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso23693401cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845690; x=1779450490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=B/rLlpkf22XCrT/mTKnzPFB7uk48sJBp1vn500i3iMhdGBfuZxBcUi7asmDu7ksRn7
         tVZPdj8IFeal0cComOQS8ZrytO3s9/MSXqHe9IffSYSezb+GXe4sk8UL4EwpPJ7/t0MX
         lhoOAyEyWS5wdf6uE3x4ZyrSVFvx9JbnQ5qCJUMcGSsbqZikSpk8S7MSpU8RpvisEUdy
         JPpQnrLG97bZvxDF5kZS/xMdg27nJeMGlu3YokzA93Z/y42djsuVC8sDJ2iPUf+9MxYO
         Qnkq1wsUdliBRaNUa/mwjl5UVb0T9o7wAan9TdggKk81qMO0MSz4eXOc+c/3Kb1B7zzq
         htNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845690; x=1779450490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=IlhCtLo++Gm9v+YNQo5FemDrCmM+icvqmzy9NgwP08RxyHM4+tPJ1noD6wq2GRIVuN
         0G6FlY4S+NzHsTtE9bpdCf+7DI1G0N+EVtOVMbmEuDBjfhbSGQCcf3QWLXVS/06sMyY8
         l44Lqtya5bQocPZYaViDj2KzVzo2pd4l3MDbFZNBrZdKz/0slbxrGSIZFKXc4AcBG0NI
         NVotIbxuJCvVo8g77TI2D3hlLyOvgDXHvodx72WQVKnjs91j/hsz0WK38EN9BNNG/LsF
         XIaF2LV/AemXpPtvbf6e9jVTYHelAl4vwU2nt9GYGhf8dNb1EEphpznCG4jy3f0+0XiK
         iJOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oTycFVhJIo9b7FiBZLNx8md7wgOdsT8v37c25qYPJK70P3h2u+Uzdo6iwblq51ylvjVZLgdAn+DE2@vger.kernel.org
X-Gm-Message-State: AOJu0YzvD1gvHw6AYZSVdfsVOjfccsU9pVPRgi10pqb/fRTze9IpHydw
	U+2iJtPwCKtI7ubKsJcfr15+pByd02QN/08gYvtik+lY9UovIBbYZjGKwQZ2+P9sSXXMZiq5ke6
	5E/C1lfLb+QCAszgvAqpj81bBajIoAzcKynly19aVp7WWOvPGAA+KL5O/ideWqS7NwLKkdFTP
X-Gm-Gg: Acq92OE1Uh8YYm/vtfMx4z3b++Ey4tbSd9lEqT/776oJWfw0n7BVpH4dm0q1sZExZh9
	hK89pmp5xAduAdZJjaJBWYspwFliWPDRBYWkBqSrZmAP0WIPEAY+CUDfr7Rg7QSCOsHppWQdqj0
	5lSG/1q8tACf9kNqRI2+JIo7L6h//JvC0MorFQ5zsu7wKF8Wt95II0AYje8of9T6z0vk+O8NRzs
	QaLqzTiZe9SRQwbLP7aJvRqJAjx2BhJ+ogJcpuZRkxSWVnxlneo5dLubmI15gzBjyxFqGfQjC8x
	QYo0um+HaqJPivSpCz/5CK9ERtntQTuoNL4c7YtSGNf3rQ8ZNCHjOS7dLti3Vs8qIDj5hbKhtKp
	/BRsHSjJKbtrN6213vhW/KEWGRp8BuC4XNvLvsDm+VB5M7uo4/izcWlo5RtMLJ0XOMDgsjT+vCv
	y3QzaAaCYLuKHmy3oCyCo+tOJLZ2M90k4Qgy3lpTzHc6lezg==
X-Received: by 2002:a05:622a:a950:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-5164155c029mr78223571cf.6.1778845690296;
        Fri, 15 May 2026 04:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:a950:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-5164155c029mr78223021cf.6.1778845689662;
        Fri, 15 May 2026 04:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:00 +0300
Subject: [PATCH v3 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-1-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0ddAvQKZ7Qmp9e16WDcQP93Q3AoxnF/5Qu
 cuYRexvWlGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1ULQB/9YTt9SYYmINJ8B/XA+CM6rSmr1pxaqAU5Xm42zA4d5raA1RO7Jantz7vGgmpmRZtJqr06
 dbUdc5FvmqgkHNtbiS9l2S0COcqo6HMwHp9z0pD25acKlpIOyrimjuVyyNMD4tsLBAurhW7vkJF
 Atjt1uCqfqWokwRtoh32FSV+NSkCZ559XL/ng6RlfttzkfM3OGqvBGx/CQbZ3D5xMYwoTPqjlkm
 u3vmsdZH6tCUf4DOACVCy/rUAqH392NndlgyWYHV1EDLdc6tko8X8uftYzGbZ9Ty8IX5WKizxNx
 KvAcN6zJJ5OwSTTKakHFnBK1kOPm8hoQ/lp5rqgvResEWXTF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a0707fc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: xyt2kH6kQWRHhrkP75-KAwYS7k4FVtnT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX+7diH+nqs8bE
 BiLesrcewlusdST4/Vt3fF/PcjpFEIcR7wa23IZu3HvHb8ynsIdXO9ORQQPw5ib5B00JjGp3opK
 ceyOolqCXIXKvmAslkqKcpMI1KG+SdmtDOz9YcqNcJqb4n6pivCFfZZYSlyOoPdZXG7f/j9qla8
 QX0iZzQriqZOJM42QVvV+BWSl2Et93G/uCLiOzKCaCKJArXnXeAOqVQ0UGPuiTOGKicJoU9/cGi
 xPU7sErq8BbdGf+5fGxUo4VEtDOvpsmrKdPc/q8IhaeXDbvkHwcR8HC0w1vUE/VknoWsKF6eLSH
 BGVND+SxE+RWCBzucEWwhom1/LVzPbrBP7A/ofmrMKYNu62V6NIBPeKxYkSu+S5JVWFsXTVk0Gx
 osGsdx0zf6aWzIUV3VKNVgnrctTvRECepLuDflLS/8UTY/jc4upb8/jTOtMVKGLhmrEZee51Hmx
 fYXJSvwgpRNXlodPtOw==
X-Proofpoint-GUID: xyt2kH6kQWRHhrkP75-KAwYS7k4FVtnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3

