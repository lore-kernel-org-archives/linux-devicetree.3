Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D4346AF8
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846375; cv=none; b=UWVEYeoNkByjeQyTczbSBsmZ8QP/MUdZxf10PzD3pe0unyR67NO+hHyunFpThHr2JDqXdrVLXbB9i2O8M6rHOcMQ0RgbJPI475C79yagG9raCO7m/pA3+VvyAlvxNFC5JrKDVbex/jp1GCQw/hnQV/rpvp1y6UoH55ysPoHlha4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846375; c=relaxed/simple;
	bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2dHncPn/PNYbJWzHLM90PGWCVvWuUsr1WTLm1gEvKOqSat2fUMci+4XfUrPev5sWvp7bwQp+Do9Tf9tFsSsemK5bYLYNdsSyCrp6YoZxC588iQb23CorwrV2Mmv7dHYxVGgYcZsrN8LlvJBWxFlJEkdlkvsrmI1zDrldHSNiTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atRImTyp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lud0rfCj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atRImTyp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lud0rfCj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBK6ie4008506
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=; b=atRImTypaWq+vaUC
	aoowq9ZGzAZI1YmvBE8zaMxzwNDLQzNrt0i5FwgSh5jvRBFwTQdmu3eQiqDskwt0
	rCxOQ/Cjhaq4eaJmwifvMRZQci4+xTLG15hqNTYo6C4lXULkuvLeik71yxnvffFb
	3paoRvdT5MpcPn8PLuF5xiMamJXPzG26r+z6rQ1wklfjrQFmBTKUyHTm0bo3DgJZ
	/FoaNUGJZXRQiYV0Pamw6H2dCjHUFKaj2d3RfOnZzPp9QJoNPP8LfWhhqk2vMUHl
	S0A9NRUVS/76H/BOnOSuuxjAhqSWz5VEB3Q4hqVXDAe6UiKVSYlHNdJMN7iJh4Rm
	4Qu6aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su58j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51494d74d4bso24147511cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846372; x=1779451172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=Lud0rfCjlbxN5JNaluZucclWdIPgZGFqh0ILR6N8iUSGJGirPdA4VADV7f7aL2cXva
         IGQCnrFcwoZ11eppVoKKF6dd7iOPuNNTK1wo8HCgPehI8mu5fID75Qrn2IoWDXIdyoZS
         YLmVvnF1yZI3JlDWs1vTSj8Cv9OSonp4MNGPD+jT9r48ik29bhRkxjMtGok1CBnqkqcp
         dZO0mebmmjInJdlz0L2OB0rxnQptZ1t0419aKutccW4PjHjuDInPmKwc+crIhOE5eq6f
         ZQ0NmDNFhmzXjcrr2begg1wwnZvhYk/eCevK1AxXFAKplGxGj16j+UHcTsCk3kQY7NTv
         W81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846372; x=1779451172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=nfk/lAbZeCtQVDWbg2kaC+qgrD5JpYTnKhPChT5XjF3KnU900y/+i8eGiqJMM9gUrn
         Hu8jEfLQiG8Im8VuWo5zJSxJqWIsQoCbsQ4EBNLh3k/pzDNRhYnVBPPT36qC7SU9ycBy
         oXwV8NrQUS7tY+sO+B7iY1R5H5HJfiN7rWs530/3KI8PRI9Pi+Trwm/jYVWTqTjiL2rw
         vsTp3eg0/Cnz0cFZQothxXwWwqXmlCM1GC2hz0GuJTtUZ+pEv5wN78gCM5zMNTBKXV+Y
         syIKUK5sUGuFJEQIhlCPN+KTOsHMuSD+8posnw5DiKD7gA+aCNpmEq9vyzsunOCDr01n
         Foqg==
X-Forwarded-Encrypted: i=1; AFNElJ9HjKBAF0USiPnvlAkD40kJWWZYvpi4ZSl7QzHvDgT61J2iuHch7M8vGFxi4yAc6aMLPdGLjwuXPsvY@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWO9YZWL+6PQmziCmSrIYjpSUvh4QyZ14PIwLjq7IaTDb0+qq
	JOIU2ph8Q1+yYwrOBhmvCXxSdUsCAuh4aKAfkKlMTMKffyltbXzUd1H8h7LKtSPlXDsF41N3TQ/
	ZokYcHbQe2BZ/AzEvE9aD/9P8icVjNnwdTPPKReYILinlIMl21wNUsUS221efajA6
X-Gm-Gg: Acq92OFPdySc8OaA0JpvXhjm7MatMse9cXb3bqAnyBnQ8F74XVVzUbo3jPMrlLUkV4s
	l7EbiC7zqFWkrMIfZm7JNc+YdEmw2Fln1hZsQLS9HWPsNyLTnKAsOHUl1tEDmvTMXSOqUrV3LPo
	12ntdHo3LJtTzHD5g1qztk5F2xOfgqlaTztKSlfJONyGy42mtanwe2SfCV1M6eL8Xd/IVfeJp0U
	IAKcHqNT7+ChD2qxTK0EtwOi4r3j+bFL1CecTcV1zo2jo2xXJlBt0o75usVZtSX4A7GgOGqnrPs
	VDnzIXneWI02yWxWg18ekSAK04NagtsqR+I7Ft273gERrGvjMB0+xariXfD8MZwxxJjMNJSxz0+
	EqJ13BwxdsJQwAdpYFhKpm0dJwXBSb4O2xpFv5FaZUG3p/7GVbQlJabCCe6X/U0SmX+eyexbuwU
	ZZvIH0T6P3qZ/o98ghwBEYovrN+C1CBpntt8AdWG+uF6+naw==
X-Received: by 2002:a05:622a:254:b0:50f:39f4:3a2b with SMTP id d75a77b69052e-51641967867mr97237971cf.41.1778846372538;
        Fri, 15 May 2026 04:59:32 -0700 (PDT)
X-Received: by 2002:a05:622a:254:b0:50f:39f4:3a2b with SMTP id d75a77b69052e-51641967867mr97237671cf.41.1778846372086;
        Fri, 15 May 2026 04:59:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:24 +0300
Subject: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=712;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgPduWkAngFc0G01Tesp7cCgfjcVKboQxbt
 YT21p7aWzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1cM/B/443v2lMaVWPHvJrTYc1RFnRzV5ivedKaUcEWKFICvi64tyMvfY2S6isJjVmCVGX7b44/u
 l6rbKs6/esUkMEf6BToi3ya3P6EZsmyoGDmD55JIgE0yyHsuc8DrihOKipB/H5lWYAQUmZCDFuy
 X3uIJ9hC0/ifpQJvYsykiN+U8IH4izBvspB/SqoLF8INoQxSqb6xMHbpOZwtmidsgcoItSVtqwk
 94BGZq6tpfCdggzDjGXHaQwQO86zxHJ4BUSN+ix647dZdd+1Sq4P4nCKLf8AZXqq7IUIuYP9WeO
 pYsmv/gCtOHZa4Fi0sr5CtUmPgd1Sfj/oi7vvMpmpuUTqNqA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TQUt-QDiJtFDNG_Hh15SCZSVTRuJjgYe
X-Proofpoint-GUID: TQUt-QDiJtFDNG_Hh15SCZSVTRuJjgYe
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070aa5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KOvF56qbc03BBMn0VcwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfX1zJIe/fkpCPM
 VWct1F4jOPYe1nxQfqlenOrpL6/UjPaeXrdR4Itjpl3DD+xYlmvp+Vk2vvC5PWhq98SWQcwag1A
 mt0DZ6959cKCLwDSBs+JIJX9O60W5jxe8f5cV6YyMNzOanbZg1ugVSSThDdcEmoqDA2ZMxujbD3
 Pad2RKf7qXd7q6YTPJNXAbcK6MgoOHilf4aAAH7L8/KApdNBHq4MznngPdW9Jzs+q6vgWNo5yQp
 s1bX5HD6xVeUyHhNFzV6tz+1MqP5F7cBG/31vnPR/KLfcfDo+Kmt36MNJjcLVbOjNPwTNLnZQzQ
 zEwBIvqbaRsf9mFrSjZWAiEPGmsUO0YuDFd1prjLEjqozXybAOiF5Qsc1Z+/G236pbvk7W7DpeO
 fI2PP+C+wS9diCViNv6K+clX5CkE/3KTY5lp0RELYuISnlTLSp45FGdDjdTzD4ZRtTHLriNTjaU
 a+WV1jmkK0bi0vIMlSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150120

The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
the video GDSC to HW and SW control modes at runtime. This requires domain
to have the HW_CTRL_TRIGGER flag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6115.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 4c3804701e24..c5251aff9886 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
 	.pd = {
 		.name = "gcc_vcodec0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.47.3

