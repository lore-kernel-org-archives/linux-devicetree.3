Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF9411FAC
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572611; cv=none; b=pMvQwNgaDVOX3MyFaZm6V1SQMmR1S7X2sZibD3kkiXMYvXPOpflzxESnD5xnEE5AzDAgQYJdICDrw9nIDAkuP/gcDeY4taaVWdmsQ6mvq7dkKH9J5EjEDwTqj1QUMDJGVTB0THAwz8wc4Tf3uHYC4JcTikK6sHsqv7icVKujRRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572611; c=relaxed/simple;
	bh=zQploYAcpfpzUvpEw88xdaf8FLJNQSzoWDuVL812NeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q3Yr1oKLf6vb/wcNWbN24+gnV4m3L5t07Y6KJUXQDMlK2+Ai7YqGnaVQhGSF1RZFKruNUxqfyze0bq6ZPks6+fDQT15nrAX65qK8Zq9rlBeS6zMTVMCuF3WppiBvXdFGNVbgxYhmDIBWHxeI2E7GDlyCsLdhL7ZyiSfEQ9DCKFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgPyLIuU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EV0+/WDu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgPyLIuU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EV0+/WDu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMTC31673133
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=; b=lgPyLIuUXksMsUj9
	RObOxa2ERYFPKqd/vmaq8RK0q+AEsIVvTLORaCFSBH3hqSoKwcfxyPHLgfXkS+Gm
	MGx9LBpvzNYQC1CwQwFGrrbPHduEpEGOY1mMkjP+hSE4LwF1rqpP8UxSZwh0XgjV
	GY6dBIMjfBbJy7aEzIpL6wFdFqUxiU0UkihYoUjRf6ilMhBf3p4AzyCpnhHnJJ01
	u6LHxvDHXl5/Soq0BUhcOz72jHH6gtQ1Oz23tz4hVlllL24DexowECHSrt8xiRG7
	mfqNRy0aja93xyVx08fImcWaCQGUqZv1a8OQOg1hop0ff2WO/vnu90h8gu6Z7gAJ
	9Vzg9Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf11ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e934385db1so39433616d6.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572608; x=1788177408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=;
        b=EV0+/WDuciAYX7mFyFCZmpdNjPSO1LT7AcUNttazF2ZrneIGpvMRllrGpD/WF986E5
         8yYzqXnD52fMGZOl/8IL42seji8ZWtjO1LFg6PwKBDhz9U6EIg/NnAvFW05Mr6w6vHlm
         FTq/YhIGeot0CwCzTUlH8a4PRyWxb3DiL0XLep+GoWbb+ZsXkf5xPdd8Al84LSHMw85M
         mZKbnpxQPDBy2DzE7UpAuFzEAp81Irn/4a8JYA3vBMJzI0iUfN/QmWMUns/hm09X15Uf
         3MDS0/s708N1EHHqRJkXdicZ76f135GD7CSk/1oh4bROIKllE9Ue2M8Y1UJ7B/Gq9zWJ
         +sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572608; x=1788177408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFugYFGBFnyfj21TM/ESkETqWKp7XuqvRVefKQTcAvU=;
        b=hj+tubCZYuFNaBs0bQSuoDFmXqR0em12xra/aXFR6wAzbTre72qccc3MY+QClUk3bv
         FHcLaum5FJuK0esh2LeY8kRrKDthgq1+2+GJ5bD23lTicDE62Iy1YQuk1Qt3IrguDHjB
         mpbt7eDO+WUIIeDtp2wJp0Bo6V32WCPqTK/kP2Rjh8w40jIP8irK1VWDO9Ph712JLyDc
         tzJ/lwgBDgD+MJprK5C9aDaez5oUa2O+HSpAusT+bydP8u0rVcaTV0WIR0UFkwZc941s
         snRdmnecj5KPwfIe8hYwGgqq6RUTmwgI0p3UZ+UjOhwMYHJzwfBdbhZ5/Dokoe/CWCU1
         9Bdg==
X-Forwarded-Encrypted: i=1; AHgh+RrQaT/SHS3zoNudeHif9PDPrXglEoiwggBYSDQHeo16PjUWeaHCO8TyVL2DuiDJY/E4yePAr9RcUCv0@vger.kernel.org
X-Gm-Message-State: AFuF++l0ajHft6oq4WU6zbPn8rRFpdM493MOTPRark9QgJFvKW2a4gbF
	Zhu3r3EPMM2yzed8AnPsPPnGyLR/eKh7+c04E2ZiWLuOCHZaK9XHu+cAvvTwxrH+f30Slzc7izX
	UMA0W4E6yASwwdW13hH/9DO4np9XBxgCuBg1K7uWZdma8/WzW3MOi7UQ6IN3frEeu
X-Gm-Gg: AR+sD11U//zzbjWSrgqx3QyvqToehYsYfl9kdk4fAqOMavVFsTqJa0pYrroJSI9VmLC
	lq8PGG9uY+jxEkdkW0JDlT7XAI//UeJ/Iz9RvxyVfaCF+F287oc4hQyVYXh1OH6HPZ4oMG8X3HW
	mk++wQYc9mMHt4RCUOdeDqVKq8x9f3t8mxe+gMjFVcAuATvDgA5j6lXXn6RkI7OB4VpOMbkPBpW
	a8soLkUcKUdGYxTQpfDtVqxXqa2zJlbAHiFREXj66VVYZlrL8CW/3+pbWfVubkl/VIXfpXE3CXU
	hQrlcgo6p+gJC6WYnlpmW5tNZHFolEvU/+u/55SAJzzCn9hwxGKRMN0RZjhO8/9anh+2yyNVkNA
	W/9tGUOKS
X-Received: by 2002:a05:6214:3d0f:b0:908:8f6e:52bd with SMTP id 6a1803df08f44-90c80e4906cmr270259916d6.23.1787572607355;
        Mon, 24 Aug 2026 04:56:47 -0700 (PDT)
X-Received: by 2002:a05:6214:3d0f:b0:908:8f6e:52bd with SMTP id 6a1803df08f44-90c80e4906cmr270259286d6.23.1787572606561;
        Mon, 24 Aug 2026 04:56:46 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:30 +0300
Subject: [PATCH v3 43/47] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-43-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQploYAcpfpzUvpEw88xdaf8FLJNQSzoWDuVL812NeE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD/DJJJ3dNTMNzUMpZHhmh/DiGqpKQ6eQNnC
 hgHH2it76aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww/wAKCRAbX0TJAJUV
 Vi1vD/4vrfheKoZtOk7PlyxpkpxAWb/6bbb+v7F0EIGBuHHko7aj/rJ+ajx5CQDGrn26c2laUkX
 O8lJhlp5qFvY9fVRbhNkF/JDdkYOuOl3pNuDim6RmII9C5g8r6lPwnSBC8l/VHBVwFl3rYR1hMV
 pnBEZ5E/qmP2wfKeBA2cY+PbZGAxEemaK77BtvVii/qP5wWcmMFnCb4vNp44G13KboUPyWaNYXO
 A8IWDi9EAhQFwqA7bWDUOJ5JpEgnq8tuoT32SEGMovxQIQa58Gk/imHfw//ajnkUs63RwTc6AjI
 8FGehrEnm0EcaepOjudf/y2baFIjAqUZEmf8ODCF9bXqrC7Mw/qkrfPgJRpxkuG1oTHBr6uokEr
 D37LbI2gpm3MyBm3oxExZUqTvuqlMVhFhvBUS25hor+ovPgUaeSlx0HmZM7P2cIOA62C7N2DliL
 6966sjKolxWdYuPvQ11bQyX2JYnImNXCS35qc7VKYrMq1uBOAgqV729qUy7JA0sTUA4Z2kf+/cp
 IS6oGdV8axQn05nyjjVMsNphJd81c1krtmYrLwVkijqRAiz9y3JttrfMC2wHd1+h+TRvAOaUIpw
 PR7Rz3gDegAcsDfQxgiwZaVUCTAUw15pBQhnHH6iPBk06JSXrMckD5MIeU1FrECR3ZwwcGUxahh
 Gb9JFaTLm9PHHCg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX/8RHJCypGI2P
 yNBeCYQvi8RkcKMP85UOUXOkRcWxJvMY34KSOKZT3W3Jl8TqjniTnwokO0okpWJdMYvhpiD7lVn
 j3B0VOLdzzfa965glefkQsofKemqdSg=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3180 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cMt5CT0DYXTQOAQHtqMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: KNFjrKpTJQ3EzLe0rRZ0-eQwF_gyH-Co
X-Proofpoint-GUID: KNFjrKpTJQ3EzLe0rRZ0-eQwF_gyH-Co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX4w67xf3P9Omr
 PFXC5f6RFpeJRvZR45Zt/jLLHjoU4x8sTRcmznsIhU+XJ3I5V+0IqGll5r3zKBSAzfvFUIJBmmM
 pi6DwL50oO0Xqad6U3Q7IROHcsN9CKXGGHFTbNjod4Oi3r3qUD/dgKfe68xNrMy2EsQF+Qc5q26
 k4K/ZL1Xnr+FRdoOq7xlZXqTpIlt4JQbwYnjzaN/V0M2J9fIQ2LHnhe8MB3DiAJz9s3QbPiOBAH
 qbHPLfJAw2HAY7cf5xhDTQs9t4wJqRWAPjKwIMmUwRqmp5vwUDkotqCzFobLIxOzKMQy95YGIIS
 zvP2KTL51USrt26MiE4exdqiHYYFN0YPW916diylfUJIWVp7nHSjP8xccNL7SdoCyDxiWutQlCu
 MlqIvmwrRE53zgAx0I9DlQQ5gi2E6O9ckmEBLz2wZqfn5wUU1BTcDQJPTqe47Efk2MRIqGZFiEm
 8R2uJA6xoDpNIJtlnww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..176cced72245 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -942,6 +942,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

