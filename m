Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F341B347
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675699; cv=none; b=rLd9j5mxlUshBLTFI1u68vzSflG0WJ9w7E0DZX2gFOHjy7nJOhftVP8thGKm3zTMwnhMz08cZ6dH0Zes19PKGGnZzBsr1LWsBIqqrWPZs0ljGAPTOFCsWjOgDVzYUYADoWrKSvKWbcfemVKhZt41tb/ITpaV7lFfaClgBuBs89w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675699; c=relaxed/simple;
	bh=nCzaPtOgAzOu6WMMaUkEsvKLphsm8vVsM68gBNmWkoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gp52ZrJiF1Nf3gVOkr8059bBO/yJ3012b2MEp0rzMcNEXBDHpIFO9TXykbmCFiAoXk76IF/CK3pw0HZscC30KDyisLNxxGvw9+ISNkpb0+N23aLgCT0E999AklK4l2oMR/8x/2gc+UZW9iUjnzPOjOGXx03YBAWyxVe7Wocwhdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kco3/NvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St40usoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kco3/NvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St40usoF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DArnU11393027
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=; b=kco3/NvBpt8juL37
	CBPSl6xQQ4oPvWn8ZmA7+ioZzrRJwtnejWjIeWMtkp7QoOqSfDLRA0iKTYUMfeIb
	aDmbgnau/dTG0pqVSACrdkoSv08JwNAXCD1t3w7dBAnGXFk1P1ac0oA4FlMHAJME
	HP3LwdHi7LkmDL5G56EMujT1hEzALsMid8hrEsMZytwYxz9AIiioY8BMmeWH/3hC
	I6Fy92Ew9Tjkl1q5R7gaaZD8JMdulp/GyELgwu9MrzrB6KgnonkOg5j2LKcnfDsA
	rxiecPjbT9xIwt7E+gWNaN4Px6Xjm2iCSb1BmWzcHzT800jzz4GpLddvFsZj8bvo
	Uo8sOg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261mqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso106193271cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675694; x=1779280494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=St40usoFugQv0S0nQTyYLF8loiSopLHjmzHZpahOKvFkd5c9SvdP4BBOlC/oItjpsh
         /E7HZhery2Ld0WXrISCylB2e7mdtBicPWZMP7/yEUdpNNGANlA3e86iObz9j2+669i8k
         8rgRsSgQ+w4kVqlLjZANionU/PXCLiTW1Nwskg4IEAZA9yUT+LlmY70dq5OUAnW0owV1
         arCMW6SbUYPx2DbkvLRtpslWGH4PN4J2XazFEwjhvLIG8CjY3W+7O+YuNxnhO1nndyn+
         ZWaS1eJM1svbbDo7RLlAbganicxCGDN3AvkUtaaujDBJvMu2luvLToeJ9j+qR1zfTn6w
         Uadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675694; x=1779280494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=hYWPojF3GyZPQwFuGDER1FgUILhE5i7hTmIvlOe6aS7zuKtERiHq+a7laN7YOFTudI
         wPUqc7Xv7yYMPvDaL/3vXFSH7hf5izGcOnUrzTilllqK3oJHqwddb63xdHiyPwcvbIQJ
         XBX4tpnQwMo7BLKV1W10q3uD1JysTdgpznVp3b/p45xN5K2U6J9OdMkEWHy0UXqOS/C0
         UHakzdWKa6jcUunrIRB9JcEv7NkyiBLm6gPBGLZVTJU5SjHV31Jq5Z2Qd7iBef6hzABj
         po7060xMjtZ+Ns7GT0rYLD448q8cvURfT+GTw2KFBS3B3BxPNydKs7kqcQRQwwRPTvhN
         dqFA==
X-Forwarded-Encrypted: i=1; AFNElJ8dfiRMUz8r4XufvN5hfqQ6G4eRJXnfOlJBWdzUzGf0WiuS3e9QVioGuYNxnHbCX6eubpGTgsjmHEsW@vger.kernel.org
X-Gm-Message-State: AOJu0YzpgepIGakppO1abuVqGgSg3RU8aTgHpqNvHt6iP56TQZX0Nt1i
	wlygDMhhy9z6mtaEty8DPVy9RyseXTCluRgXDInO+zmLB1F9Gq0R4cRdWRrc7vVpsASgC0AdQgt
	l17bViOC/UEPTU6uFCAVycI7t57b7km2DIz4Xnk2SvuGd/U6xmGxzAojBeCr4m8Sj
X-Gm-Gg: Acq92OGYIsMSC6pVnPQzsZRXp1s7SeSgTNjX1FTb9t2nXy3H/qXywnxvFLIzrX1wYgA
	uVKlQqSBXsscJ4yYAE8wjq26amTvhr4nCWJS6qLnI7298OvJqnbZJAIlNXcSsT+0KYQp9x3ofgM
	YqMtFVGTMtHIe7dN5Mlbh1unQ0ML/IOP7xvC+t7wtdjfcZkVo4RGvvABeEOzQpO7N/ixSX0AtW6
	Mc2eYg05hLM2KFtP5ZdG5U/nYfyNkas1vYgoEN2+Y+BaCQTzU06YBqkVuHcwDNkzrYyvvqO4DKY
	i+J46Ia1EZyDzurAZJnf/TcYnhmA8LEGORcSqYlnojJ5Mvj0hrhkCWzeQqItQZZDH/mBFparV5U
	zxiNx7mUG5zThH770a71Wj28tBPuvu2WuTqzc/7cQ1E/cV5POqeUfnJ78umwC7tZ4HsSu9ENCgm
	XCUmBTqhh8d3VDjfvj8FgWheY0xVnu4L1eyc8=
X-Received: by 2002:a05:622a:8c05:b0:510:1492:c3c2 with SMTP id d75a77b69052e-514cf00bd12mr89706571cf.36.1778675694444;
        Wed, 13 May 2026 05:34:54 -0700 (PDT)
X-Received: by 2002:a05:622a:8c05:b0:510:1492:c3c2 with SMTP id d75a77b69052e-514cf00bd12mr89706041cf.36.1778675693886;
        Wed, 13 May 2026 05:34:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:46 +0300
Subject: [PATCH v6 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-4-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=leB8+LKvE7kUH/wvPz6CoXenJFqROgu4EIFsX585OSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/liNp1cbKAlhIylpeN9llca/6kx0/g8+Cbx
 Idj8CF62YOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1VQcB/9OBG/yJtoqZAYYlovFTl1GEkVBBLjNNUjO+c8YlkUG61X7o6sc1FEYF35CgZpIG3CzvFd
 /ESq0hxGi4N3HXQJRFcilkOvaB/oyv7d7T+8w/DFuTzxvV+jSZj423YGgRAJgkqP0qQ2VU/ohqa
 0TMoGEdqwan8iwJYpgkLqvDz6GvEg/xDo4gitoD9nOIah1I9ikmjnKK4T4XV5TMwN08wB+80571
 qBPcqfO/lSy5A9xTfhRZ6V6FdDMagJYANpCSSpfGpeEJITy8BUGI7CAXZP6xjnhqyAD7uDuio3K
 Z4gJyXjzlwXfA/iujtIz7w2xH9PSosxt0+E9J4PkI+U1RUbP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a046fef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfXyCklUDDLQHt1
 eM+wtFGOazIHaQ7/OWY7AffhUj0+9HqkROxTohsu8WZaptClFErQd0S+7q0YX9eDf+vjXojwmp7
 HwLEUwryMdPx3C+xowNJIkC8Ra9sQkzvxgX0qvp/U//zn8vR10flZMBRJv8fTTimbNypv6LaTGa
 ABgwJ/57lqPVlZ3MjbTFPG7qoyQA4RGN3mNlufUBAKWNpPGaZ8lOnZiXIhwk2EMXATjN8U2DWYq
 ladKFtw6isbvn4Ns39LumBO+DjdYvvTKZDvxPqb/rCEiG2xef9EEFgTLDqkWmTOs+CiUT8RJTJS
 HDTlzK89munbhr5Y724XlVPvo4zaAkehjhzT3CdOpehU17IV+1vdyu30e1SoRwtXvYuRY76fgXd
 YBYOb463bVg3WVnCxIPzva6bxrhZhVGzuN1lSxD4JwXPszbCQVPqfZuPyA7IAsN54vcTnetN9WE
 p2GIjR5s5gE/PfWDiKw==
X-Proofpoint-ORIG-GUID: 9QyVPIartg_Olyc4rCpy2AcaI_wJBxe9
X-Proofpoint-GUID: 9QyVPIartg_Olyc4rCpy2AcaI_wJBxe9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3

