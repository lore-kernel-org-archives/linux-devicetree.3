Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEF7416873
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572532; cv=none; b=jrtY+ksXZSVMfYSb8WO24yd8fNsonDKzSaPAS19zTi/W8r5mdK41FP+5lsT1Gg5ttkd7Q9SfdzubkNxQObudFaedpWOP7JtKU1K+etYQwo4bgFPMWcRCSt1OjbNpaUN22TKFUf1q/ChemOz1gOLy5Xy1CFftTjglEqjh31KagRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572532; c=relaxed/simple;
	bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdmay0uAG0wC4ngDya8kCR3n3Dlyige04UB3SxPudsx5oWWrDZkbtQBizgL0c6Opr3G8F3AcW7eJn+utEVlRG8DY/CuYoquJZcftkG4y/ncOeh3Mi9p+RJj43fNXSA40fNllShpileUjJCoO4FeRnqOemzpmk5hcKfHjR2UHxNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCZD6orK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOATh+dg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCZD6orK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOATh+dg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMWxl1800258
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=; b=eCZD6orKtKTiR0FU
	HYwrXEJWiynf3dDT5oIpSos3x9QFZwqJamGsNL76r3MOp7OAh3s1sV0X/xdaccKH
	CJ0SIu78KKaEzD7V2RZPffnn723ZB9V4rpSCgBkTYOfQBuyWuGztPIfrxT+VSLQa
	50YbzjVOewyupd28/fiHDJPLn4euq3i8EdVD2CD/oKXsl4XXzwBN4hCevVbZWCqU
	Mq1so5HFXJf4hITLAmc1VCiNFQoW8ZT7WcpSZYlQruKB1OqqccrrDWF+Qd3vZeoK
	5f5Fw9ffpE/ei7AvoEjpZbXEIsDMjkb2W9/dtdib5I6hyLfaj++HIQmnTVYso1XA
	um1PoA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78c0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90410c668adso30513036d6.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572530; x=1788177330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=LOATh+dgAsYuH+c3pyMiJPXoIGbW7CFjih4/TqBfxcAvH4SrrMVb4UAloDHD6GO0rc
         o9bSI9ZFVY6YW8DLOR8+MuH4Rk+OWoYYU0XywBiEF9Lb3m5UJHdwK0n3CIofm4kMgWJQ
         43cS4WCOA1PgTZdHEntsHxK1KijIrvCVwTcxVP5t+na3x6w4Y7VFMT461wqEY77HN3lH
         q1yQ7OdwDy0OKy+gm7UJ3ha44ymWdtl+Sm6Duwy52sAZd9c25/yfF+W+Ntl/lAjv8qZ3
         uFB9FP20BfNXlqIZxjTwTWLcNwoWIsQuOLzLq6FBdIjneoZgMc/pZo6605zZjs2FA6J8
         bNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572530; x=1788177330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=RvYEjRYHUIrqM0jp4BaDeqY2K/zyhU7xSWS/Ueh5pzw8SEnAghbO1UQ/hei2GCtdAF
         K2Lg+0pjjfYphs9ZBujg4FyHYglenEs23wSXjyqIiWRjwzkuxYX9Rh2MOFtLLyJB4+AO
         gW7S27kGDJjgAadwYUSEX1ZHiVSHs2OAb8Yg4U50Cd37fsgxAScLc1AGBxTG9c+fW69p
         s74eoa3GesVOhEkrQnhTz983dfr0dShA+TY0+m/dxrOVr8h7xi4flJParOkmbwx+WXWp
         T12wTdj9oPnltss1uUIduw39c9rlzAW1/k0DDkRCV5OXFfihhM6w1uyhuNjfbGPYu1Vv
         WI2g==
X-Forwarded-Encrypted: i=1; AHgh+RokO3WhgNaUKnML5QU3a+RH+fnH7JH/W0Or2wALYT+wzY1vdtwz6Y2Tocv8UM7RF0qSAw2cLese4id7@vger.kernel.org
X-Gm-Message-State: AFuF++mbJd2YfDpLylgSlrLLNjdIFMr6ozOpLb+V1X28gc4QvHItQ52e
	aO69ShhfsVr87jmXoCorTrcYCNEfGO6pIotJqKfXg+YFAA782hSeJQ8wFFqkaeWqyjcUa2hP2l0
	vCu1ufVnOvhtYuERSLFmKUtn7TM6s/bdMkgpVye9Ias9nmtoBv0umRcKvN7ThgD5F
X-Gm-Gg: AR+sD10Adp7t63ypCPKJPW9KQ8GLedNC9fdtaLMAomdRHA9T9ahuFbOkjMsaRfSPUcg
	r+04h+nP6MaUJIrgaBuhD0MI0f826DjRbRSGclC/h+8Epawz/+LUDMLk0lt2WmCC88G4RjW8Da9
	Bku8SQepKxXwHqLP7brI5EmmDOAikg/831sq9/Xy26pVlyX2s+W7uc4oKBsM0YgDuHcSZqRPyUM
	2zNf+CxLVB3lDotyP1yjSqLvTTCg7XYx/slT22Jhf875935CKMAQX/DX4c0xyaa/dsuEvtH5siF
	Dwe4y346TuYq3HYdwy+fJjmLCXRIocuFrqbBw9tPNL0ivfDZmRPjEZUchCW9INujJq2r1NwKwKr
	HmoeKts68
X-Received: by 2002:a05:6214:5906:b0:8ff:6304:da9 with SMTP id 6a1803df08f44-90c809c34cbmr273380266d6.6.1787572529450;
        Mon, 24 Aug 2026 04:55:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5906:b0:8ff:6304:da9 with SMTP id 6a1803df08f44-90c809c34cbmr273379516d6.6.1787572528816;
        Mon, 24 Aug 2026 04:55:28 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:02 +0300
Subject: [PATCH v3 15/47] clk: qcom: gcc-sa8775p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-15-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDk9EKx2CK+REMhrD15CuB1Bm0YzdBM+len3
 KGtgx07HGCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5AAKCRAbX0TJAJUV
 VrgZEACABx4JeD9/rSC+xgywMg72QE0Mv9tc0EJdfy+KRkf1NOZfMp+gTdvq8Ycmil+o737NirU
 jkKZar3dESkBSmg/Xu0VYtNX9U3yM6Kf0LEiltjTdZhR8bLyqUfuUzixtJg0DVQwJfxRk5Ne5NH
 Zd74qH+obCn7cCo+ZwkKPXF2tfxSRiB8M4PB+4OxF8K1u262s6QOAOm/XFcvUX9mwI8iAHRpcS8
 7+FSPDHmbWN7QwsyvRXKlDvy4hE5ua+vnhG/P86xoNmrEl8L05EyCq85o8Hg+eJ7aWZrurYKXwR
 YTagveswuGtT77LkOVFbLkcG1kg085jcLbJ/jkg10r8HcXAjF7z29yQ5HvaYnuP2fseAq836dml
 TbFjjH3wc+phIzV96oThl349Bk16USWQIjHFjwqFVwcV6UPOUa+Udmp4gXp3tEP3CkOHCIAR3m3
 fpgCV7Sec5fwr4jzXfH+rq68eCh7axzrB2LsJxmRVTzVQT5Lx0Ob4QtnLCv9hF97EzcayWQRnVZ
 3pXaC2mEngOI3SF5ZbSGKIvf6TMpw4D98o8DY2DkDrPfg26k6/D3s9cgkx7vAxBGwffBRYKgE2R
 D3eOiGTHX1PVSi69Dkf51rYRfqPIKUOcCc8kK+uukz8c56Viv3YbT32tr/cyRYp/1D+78xWDg4n
 KB7pb21rpW1r6Tg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c3132 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0PBfaT4kbeqX
 N3mFppsNxkpW2lIRQ5GQbZ9kBTlKxtKmahhpK69j7mjcahrrfjd5wBELHd4DpnZYZyCwTaI8iFq
 q8SZud7wKI949uLaLuEZAo+b3o4Pxmc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXy2zUYcxlPPbf
 5ZS9zhjuXCBJ6Fvu5dCLC9/h+fK1/FFS6m8dBETJQvZ50nPjs3Jh1jNWGNXsuLJjrpbLBKMzqRt
 NLz05trM1V/ZqvElZLfiOEgj7iaUuIVjSOR2wIXRmjUTxHzFU2kaKdJrIidIIJ/sZiH/CE83tYp
 vfHbDmHHgTijRE8sNqUxa0bo4EFu+L5J2vE13i4w1TTV1ojhUmdFl1Uyk5Sn6e5xwDJiGaNSaDv
 /GLN2BBBYK/orezMSQZEGrRzOhv5wiW+wz0SwyaL2PznD3/J249wENZTrOJZRgfXjEXY1ix+qeI
 cyMjsTg70PVS5zdLKlT/JAE+Myq25v5hs6xonAAuSlYh11BRpD6HyioLE/aTZ05pVwFDZIEbzuN
 BAOKBlOSd6ej8KzRYM8wwvUIN82xEljC5kdVaEos0Sjm6bNvJ/D+w3V2ut1rYHkvY4bs9Ct62vy
 grZjcixgMhwstNGZTIQ==
X-Proofpoint-ORIG-GUID: UpDCpKXlR203_mULIJE_EPSIETFgqGYa
X-Proofpoint-GUID: UpDCpKXlR203_mULIJE_EPSIETFgqGYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..2f867596bbc5 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4652,6 +4652,7 @@ static const struct qcom_cc_desc gcc_sa8775p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sa8775p_resets),
 	.gdscs = gcc_sa8775p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sa8775p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sa8775p_match_table[] = {

-- 
2.54.0

