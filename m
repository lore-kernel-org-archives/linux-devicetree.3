Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28AC48C3FB
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246512; cv=none; b=UOnJcSp7ryr+605eXxthYTb3dKX/GImPixaA8JnGi7KsnnGFmKlDE9yZk4333FNna9eU8oeJgwg1EP+8nUsOriOmfpuGTQ91LPiMnbjJV+C+fiVzTD0ETo9/aJxBY1MxYY/R4zEmQx4/0Mt3lSVkVbiWXH9zyP6iS5AzUMCixxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246512; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEWfw77KwK8AtaFnNz4xKDTkS3ijaUTfUJZLS4g5WcrwHAFbrHi0b7TIwhEfAaFP5LmRYkkGK73vUw5qDdo3+Kx+7GZqet7BQK/+aaGQiYUQMvTmAc2cuZfot+6A3+/GFSUugXIzM4l5WqRsQekDYrs8RqPg8/WVgH6wSVRg2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COpumCkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk0jQ5rF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COpumCkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk0jQ5rF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA6Adu2333155
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=COpumCkSp4u1PEnp
	KcPh3jCAkbEnlMJEgwNhkhPATucvJWnUJtJYp8RP5TgjEArxwPusQWdF1Ro9pp/Z
	b0ZAP/TxoT2SdFA91txWuenK482SjxTURwGE345pPRVtTM8PZzyHRplQTzXFvh/3
	mwY0f/d6Y3yyIQcIct3SUZFc+8MGmQK0wsQEHa7INNcBO2nm+1Lzop0RIR7xB31Y
	a3CVJLIOcPmr+AO/5FhSwOO+sR0HCsmIeITCqrcpQdX6D/mFSDbUeRYK7VQ4MgC4
	VEprvW2wgvMKgtfzSsNNFbsfRdSP7WfgLgbPgPA76QEjERWe147jtMplgJwtHdC9
	bBBaqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjg41k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bfb2da664so458150585a.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246507; x=1790851307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=Hk0jQ5rFMWGEg5pgkeLuDqnxpGISuRL+U822cfuIaVgJKORYar7TLdJqJxsyFsXNsU
         B11Z52lfDOK8ycZjIug7lkgZHOkSNxR1qvd3azmqiXKs0Fa0jLK+bYhc1fCM8BcUV/WE
         RFX6FbRL/Cw+Ha6R4RFYWfH/0k0zYQ1xJgMzVbQrb/r5O6ZlGm2X0BTHJxxTp5mi7Tsm
         e4VmbKd7tp5rqZo/K0aTp4H2zFygxaBRmtvrde8QXuVNUJ2I69C3SOaUcWJMIcyno0gA
         IAcuu1+hJpuYb90FcxvsjfHNaWiuhn78R8xNWohPRZtSvUlL97Z2bWRD5lWcizt15iz/
         uWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246507; x=1790851307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=0sXapgZPM6eHHYcKP83vb58ClkTsb6beMTAUQ9VxgWtYoBGrom1O3TpwvtJck7TS9Y
         Ps0MvtwNncvlgFJf8hq7kK/vlvzE7PzresA1BMkWSUXVIB3kNhNunPbgaQtUJjRaGuU0
         T08lj8cut6Pp+IkminPakVon/AU0+bZ5zuN4GJlMmZU+mi3d75H6BmsG69orDk6rwTnM
         QGRx+FnE/R1mo8jK/t8ujE7B0K6Ag9SL/e1658+dxt5HxiEatnpk2Efd5gkkGfJfqLaZ
         tSCZc5v0GRVoI/WQsX0q3b2Vm8PpDHID1fASshmfHbh05H7lSqMIOj6o7yLtjwVgLCLp
         ZfNg==
X-Forwarded-Encrypted: i=1; AKwUvBxm+hZjjof5KtfrMkmSk7VzwGIL16q2jNfRGNfku8+zc0u3Hjmmm5uVs5Os3DE8ljKtFCjm/73FvmiV@vger.kernel.org
X-Gm-Message-State: AFuF++lT9Mts2vP86Bw+pBNJNNrozPV/Tg3H5PlsTQC7Naa7RmG2idMY
	QsRRn+VFmdu0Wg/vF4eWwFTAwcuekCyotnus0LfEYB64803yz5Hd1EKSA26o46UkkdYbfvcpeRk
	FpZ+9kefqHDkPLOQ8RSmH7q+MhlSDVLLWF/HjRJPHBoFzu3aNM/9gna0Ps35T+Mtf
X-Gm-Gg: AYBFou2o9FZJ++BG7TjUHPnVEGRVR/7mIo7hlq5Kof6zDemCcnkhZ23bbZYXe3WF/mq
	6ewwpPrS6VwZEeFEs7ZBwUfpQkm+EK10BBULxnOMl6FE7HW+nD1+kayj1lS7HXlsb6xbn5pHkgY
	04+w3QqJF2fgwbxt0eMisu3kXwHnq1WtWgeEgwR1sZiC4+uKrccSQJ6OfOnnOiOXMd+BP6php2m
	gkvOMbIKAyfGLruc0kresybkDN6eqWsVwM3hR1LXkHNhbiQimUCtDg2/mWuQao5WHc220fFQZpW
	fVCJ/FUxu0gR3LJhHCZ9JX+qEVISp44WQpE66hBo3tpZUr8va5hEkeU5Yxtc0XSTGLeyQTyIjI2
	RwI2HgWvm
X-Received: by 2002:a05:620a:280d:b0:939:6dee:4b09 with SMTP id af79cd13be357-93c36402e34mr222377885a.51.1790246506592;
        Thu, 24 Sep 2026 03:41:46 -0700 (PDT)
X-Received: by 2002:a05:620a:280d:b0:939:6dee:4b09 with SMTP id af79cd13be357-93c36402e34mr222372585a.51.1790246505921;
        Thu, 24 Sep 2026 03:41:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:51 +0300
Subject: [PATCH v5 35/42] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-35-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP38tHgEnFYmeZ80C6W1eI7BUPxyd6w2O8mY/
 d9FPLw2l56JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/AAKCRAbX0TJAJUV
 VsreEACWymk6MPjaJSwfX6V2d73L+XAG1cSP+OKRLbcDZt1eblcCJScw+6Csn+mwq0G+Avc619t
 /EKvyOGgEgt95DoVcjHIvmJ9BEB5iKpvOcCsnaUOp0gPcyc0nRXxmecug1bMFOHWHdDTN1flb9c
 2Z3OpXLvJynNBWVu6KUgwOhJEBcYFZI5GjntUCMo112jvv/n8Pp6YT+JVT6nkUj/gCXLbLvbrRG
 liQ+ULX9oFtGx7YgjpM19ExAkNx+S9MtFTQ39n0OTYSz2YWtaA3rhYJr0WQ62lJT4czmYgvGJBt
 ER0cgOojvv3S2VCbJBjiIZBlYdjyIwZ0oIjSYDGosLK7imQqXGrgredbD0+5XaVHop+FiNnOMSF
 dw9/CGv4xBE57hYvQpMCJVx6uqYK5Im0/CIfBGPdqMh/clpG6ZfcupWR/i1qDTdMLUrxufJsVcn
 FAKeItDxX+lxdt6ebSns333Y8CVzERmBLA73F+bs4WwmWBOBdjP1vAkkA5dJKoVkh2u9N3jgbuf
 QBvtYPOKWN0JB5YLFZwXIl6d1LWHh+XW6gk/iQXhi3jI7FRaKAhH07zS0Nwi6UKRTyTUMs5SI5L
 zHHQqRirIwKzL0s5HUlkja+hD8M9TUVugr+kL20NMcirZdSh2LjZrs9WEyC/RtNStj7wjEq2kp5
 g8J1f0mNpOb5x+g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: wjlCDFm_PGQdyAtrMnZTvYqXKDk2--GZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9cKzpf5dcE2q
 5kyuNSO3lQpkS60R5ksDCjQJvpJeDLk9icO2CwUoBr7dhG1YIcSqdVHUO+o1D15JYaY2yktq39X
 Ruqy0rYV4QecGWNyK1xRRkUkYAygbAfbk4H8Jo09ywzMiJHWknvLXvg5fo20RsMQZ78yVSLZ+jO
 eXESjW3QNOqNCSUKQlXxyU+ANhiigHqDIpogAuJDX8etOzjBflFDpp8h24qG64OTSxUABBTpdp2
 bZyBR4jmwPbmcmPYEv5zOlHxGTHfLca/zgPTXpekkPgCk8duLPRL1WxdcaUwuvf0nW3sLcFrQA/
 xR3R0Gwj7CwJr5mLm5irQBz80eMI8jcSbQXS0BAbrG3AfMgNyRFkXY+S+AkUZbDyNUzPXWPH8sq
 JqHN6l8CkgMqlt3iOsX3AmxL5VdnKmRTBfWL1M+5ahA3BBTAV68icWzxvGRUt8R7x1+3N3T0PpT
 NEce7SKpgAq9P1X0Zqw==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab4fe6b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wjlCDFm_PGQdyAtrMnZTvYqXKDk2--GZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3qba3DhLSp1m
 5kFC8M0j4hRGRyvEgweOopiQO5ACmklJsUaAv4z60FfD6/O3YP5vSqG4VyuTCjsUrra10X8q27c
 Gce2z/+409GJAt0GjJEjuzxHfjYYRtU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8150 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..397c0142ea57 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
 				      "sleep_clk";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8150_CX>;
 		};
 
 		gpi_dma0: dma-controller@800000 {

-- 
2.54.0

