Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E0F3A7F70
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438134; cv=none; b=lGpokNH/O8BVx46vuXJWp6v7bVPkTENq17N87vcwUdhFuUj1OxSA7DcF+H49HlsO2IFYUNI6pCLtWyfhaDJZlGJZgAKzf5gmkzqBGhCcPWJJ/7hoEe0GuLvzZZJmc9pgCJmuv9egSNYNhM0ocWAjMJCyr9H8KV++Ex+z5pyZrsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438134; c=relaxed/simple;
	bh=p4UOba1OsIB/4FLqEcxdWtrdpxxYB+EITNz6QmSzTFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpRm3Tfz2mOXeAj89llQZXCp4eMcNgqRi18UOJTJHHdlq4UsoGQ5AzNRjs4BWRKu01kizw2LUhya4UhM9FYTTg7D257qbsBWUPbU9jkS33B7EhKJFN86kmPQ00LdXdwCdq7Awzmlc5V13CtamYBaJcKg4uHOWqoTZWbuXNXZZMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/DK5a1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1PNUHCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/DK5a1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j1PNUHCH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UMDH1959117
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5b46QnXspbNFs9zy977WHdffoTeM1D136DZcZ658yI=; b=l/DK5a1d0TEJWEeD
	uTk2an0/ZDVyE1lsbd9iWWJeK57hmDIeEDcOIlnIm51JX8CFLiVnNcl4qRzZGPDU
	GJRP6NiwMBHCrBHNXqN+Mb9trt6GfrGsW7ZU4PAgUVM73h83vhho+I8/7Ody/1ZB
	axkJ9vlELXKQnfR/M+PeQ6NbNh+24NppwM8636bQ/dkYq4O3cE9KC6lFWuzbHfzA
	lce4w9AbiLauHB++Lp9k0hq46SX471VNTdpwl8Th4BM0Db4WfumltyUMz2+q6jH0
	Ix+X2RvW6qOMgByEVJXEnlCbznKB6fCIDxwtuXhUA9s0KVQkg/9m3ewpKvzyq09Q
	xncdMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxergjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:22:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83836443305so3589300b3a.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 01:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779438131; x=1780042931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5b46QnXspbNFs9zy977WHdffoTeM1D136DZcZ658yI=;
        b=j1PNUHCH2ojOmxXgR/fM/OUCUF5/b03zq8reUZMkhRu0+VeXGLU8u6GISuwkQqa9NS
         wDrwWhY9mD6cYqNYTXiJvBVZNdLQnRz2vFBuApZXLIqJfT4qaPdZaiwuiVsKTrJ2cuLZ
         AmXOT5CfeUyciGarxxQKRQh2Pd8OMtyc9ccMVIiOkShwXPrNxvPSYLMx8lRSk8SuokHD
         +iwtliFzKJjrSjWljnWevH+XP1o+YSkf7AQE+3/c/5vx/EfwKegDF/kW/m6k6qd6J1n+
         vzjIYVW3Dlc2DzFEtQH7mYpX6+kpP5+f1rdR5iuvGYYSKMibYR9MYF93SDem0FDNcP8I
         NCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438131; x=1780042931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5b46QnXspbNFs9zy977WHdffoTeM1D136DZcZ658yI=;
        b=lsP2XuDQVZ0cnvFeXI9xw76+rL+rHoKNBjRfADJttc7J60M7S5qfMl8nzCKly+ixxN
         yXslTlXLEY913elRkqmmobviRw6Or7f7rLamgsPwHFVfqWDJ/jwPgz7UwsIWieC5qfuI
         /nyN7mgfAimcUKJH+4tnFkFYVTcc+3ThxgxoacVf69inoEQWRneiXYy/rFGdLejapG0H
         ItwKu9+jEREa7TJjcMyDNLp6gCH7BEWCJzrrNDwvBx9XjWNzSShbv7y0gJEPj1wszTU1
         DSghoBfmmItr61PEwLequ9mp4i4XeEfkDwBYzSE5mvFTMR5PMZNpxu5+C4b4y1vjlCPa
         lk7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8PiDZVsKZhVzxeoye6cW618HZ8CtOSTjI7Y7crwNOaqn3/eNK0+9BrFQ3rxeEpEfQg/7L61xkb3gP1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3enzuz3ehg3BiGGBrXtRDXyqKI0NvBa6c8RXCqPV9mhDCtq/l
	Xysmhff0g3i0DTUUW0mJM0U63HpotYPLwT09xLpKmr2gePXPeY5g2R+20ZLtprcTzQQO5QO27+T
	iqP6DENAbneMSJtr72DiwzZqU3sVhRUiUIWj+lybj3Kp3wpkjrdWo8QrHBw2jzmRno6Fizys=
X-Gm-Gg: Acq92OHzeTsBuiVXgoDw4ZAz5grCrrGOEUj6PUktr/xihLf1bnQRpPHLIAMYIQWanxT
	70TU+w3tu7OHForfBmsvEAUF0HINzbXsUJDYmygmb16E377A4L0rtQd4CchjCxUcIbklzEuSNVJ
	UN1yKbOU9vr6P8oplBcRyqpcQCi7nudMuMw/fWM9C0JthX2k/IojArsDmB3Vg9Vnm9n4Ci9vM0A
	jYPuAKhJdcT/NMFnrv+IsYYO1LUDFq/tVneqxwhy2P/VQxx5MqhZR89aD8CP8Xv0FYYw2iq06hO
	Ib8PqUL0xhvEExnpNjOWX6YVQxiN/WG0It8gOAa/kt8U1gDdP7l2bnUYRlKK0kVRiN0rLcvcC9L
	N+D44EDHn2lHfdZHovYKBqOPpWrhL58bKcCSR42iw1HabCNPGT9YfVW8nYGA0ZA==
X-Received: by 2002:a05:6a00:18a0:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-8415f0e4390mr2927539b3a.8.1779438131041;
        Fri, 22 May 2026 01:22:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-8415f0e4390mr2927500b3a.8.1779438130560;
        Fri, 22 May 2026 01:22:10 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm1431407b3a.54.2026.05.22.01.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:22:10 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:51:55 +0530
Subject: [PATCH v3 2/2] pmdomain: qcom: rpmpd: Add Shikra RPM Power Domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-add_rpmpd_shikra-v3-2-632838e2428a@oss.qualcomm.com>
References: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
In-Reply-To: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779438117; l=1677;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=p4UOba1OsIB/4FLqEcxdWtrdpxxYB+EITNz6QmSzTFY=;
 b=cewUrS0jKqaQ8DZANDgbUxPj6b/JbOfQDx2w+TwJqwUDsK9++DD0cE3UGtva0rDkG1MNqjWGy
 E4Rkzl317BsDQPwvoIHLjBSqsX4t1i3eIqmK7s+mzXQecWgm2rrUNAD
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA4MSBTYWx0ZWRfX5OCxk6xi5zD1
 DBD/UDIzMZ1mBfIq4Tk89fYQmINbgdvKrTxUPL9xORzIePSodg9a6zuqr3uY9wG2WD1ZiQZTuQ7
 HN9jOSD7GiQUHeF8QW3CkH3Aw9NxGrsqklWuwQDCg+FDlQUBkTNobpZVvIUyHcK4CaTe7Sx50FQ
 ftzzxMZ9piOq4yMMBBVzoIkASmq5DXpY0rDJEVfPSQSUjl2WAmnA0+gRQnz4CwN1KHUo1slex3u
 RACwyNf4YrgNjuRQoSuTvx/3dEShpCU7nSV4ooUHtTtIoOjQEku51rjQCLA5cJuvrk2R/V4oefn
 dsskH5V9eIc3rCltLz+q+ctWq5tHB7VOVVdjnOrs1pcl5M8Mn7h2hYYy85J+j3J4vcW3J2QvWz+
 +PlSc5BEpuaH6pC9lFBW3g2UnSGfED0oYrMOZxteox9gy5N8gbN+lFSyf0CFWT7Oxs+W2nNTers
 efWrlQx63XvR0V7djvQ==
X-Proofpoint-GUID: S9-5oDCSoHJi7ni91mSgKSvawrlJcA22
X-Proofpoint-ORIG-GUID: S9-5oDCSoHJi7ni91mSgKSvawrlJcA22
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a101234 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ykd6rPgU8ptz3_yXT8wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220081

Add RPM power domain support for Shikra, reusing SM6125 power
domains with RPM_SMD_LEVEL_TURBO_NO_CPR as the max state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
 - update the subject.

Changes in v2:
 - Collected Reviewed-by tag.
 - reused SM6125 power domains as suggested by Konrad Dybcio.
---
 drivers/pmdomain/qcom/rpmpd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 15a11ff282c3f86b1e86c6604d165e297620f6cf..5f55fc791131a1675cbc1941b90e5dd07ac59cca 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -895,6 +895,12 @@ static const struct rpmpd_desc sm6125_desc = {
 	.max_state = RPM_SMD_LEVEL_BINNING,
 };
 
+static const struct rpmpd_desc shikra_desc = {
+	.rpmpds = sm6125_rpmpds,
+	.num_pds = ARRAY_SIZE(sm6125_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_NO_CPR,
+};
+
 static struct rpmpd *sm6375_rpmpds[] = {
 	[SM6375_VDDCX] =	&cx_rwcx0_lvl,
 	[SM6375_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
@@ -949,6 +955,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ .compatible = "qcom,qm215-rpmpd", .data = &qm215_desc },
 	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
+	{ .compatible = "qcom,shikra-rpmpd", .data = &shikra_desc },
 	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
 	{ .compatible = "qcom,sm6125-rpmpd", .data = &sm6125_desc },
 	{ .compatible = "qcom,sm6375-rpmpd", .data = &sm6375_desc },

-- 
2.34.1

