Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573A1446824
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447077; cv=none; b=CUEZMUR98/+jKtVveUissL1p7/0j2pTx+bU//R6zaa8Blx0BANSxap2v65w2KDUvkNDYjvnyahGFT+DkPw3HgO1hTeVsVpE8VKHgBICxsfMpTeNbMLzKrujIDS66oDyTiwvqDd1gS3B4LiRlYF6WTSDLgf1fOcJLpLe+lmuSdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447077; c=relaxed/simple;
	bh=KLSCJNqWTfQH3hCgEppY4XAKXGuCvDCp1TPzxwkMcv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eATpPwNoqDw55HlvUmT9PoLu/x0B6B/Ob5zP+CpQMciYAEgD79OeSWuAntnb4R36Q0UAsZQZJosgg944NSZo34nT26y4GtKlCrlkQdruWhEHghBfiUDB6qgREWFv7MRoamcCxs8tdO+E3rhPqDvUtI99kWARRvmVfRThStWQhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBbLNoTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFntsM90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBbLNoTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFntsM90"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L2mA2067968
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+YSuDvOoF29
	231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=; b=kBbLNoTkninLLPGDlqi3hsZIptQ
	a/40r68KnX6acR0fd66zyls/hkS2Z7hYP6kaobnupT9oVAqstkTfCsIVzqZKkxim
	XMiyI2MnHNbmRhvGqwQxkgkOs94yGeP3ZxiWbqZ0vgWXuk5jXsG282myZ8tAdyzN
	sUfaA5bOfOw19E0+Rc/xOjKtO3bbS/BL0XMfoRI90MeAQXSaW8sa4evSiHI5G7mK
	FbUsQRt29eAUoJu7VyXdczJTj8x9ouvRbqzVvTafdcH2w/ilOTVziQqhUv5pWlEp
	RgBBEHEsY+83dZ90QS9JNyPBCzkqRiqmVqeqirO8ek64w9KA+aVAaXCT3Ow==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hufx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:11:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so14490183eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447074; x=1792051874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YSuDvOoF29231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=;
        b=DFntsM90gzLfHlfqVYPF73BoRHH6ehRGRoSHoIuhXoQ9BqycPa2ra4+rNpAIVuyW6g
         0aDM7XtQg9AfUCvdthqHLpZigjPhEAmQvV9R/cJNK5AYGZEE9VT21YP1s4cZvUkJNI8p
         QFM7hjZ5bOA0DBrrmeO0Wkct9a+iL6Z4vTIH+qyoDvuTkxo5d/RMJpIjyYitnyarPjcC
         mGf3ht9jRS5vgyZe20FIH2HPa0DJfZxnNAQJtH+lKxY8blW5OIS3FJJdCbkV+tcD4cm0
         TtdLtvNbyNk/2inTClojzrQoP5H/qkP0aJZ8GsDGiH6WQiB/3zw5CmNA6anMAfkLX7O8
         /ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447074; x=1792051874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YSuDvOoF29231NTS5Y9qMD1wu3gOUz6rCSgcpTgpGg=;
        b=abEml4oaumX98/FCHze9kmNXzu+q0+mK18kphOVnJmk0UxbdcK/dFByWSIcMd8Q7SC
         DT6gB/Lli+8xJb2dv+LN5oGoDZmVXA/6GkFnm6xQ2G9If43/FFh8bY2pFI7dVqqafu+G
         CPn/HHXFmA8hOx7LSAaYVC94dMwmDNsek//flRCF6C+gZvibbsneH5dWX+Kc7gkLAd65
         iC/CJ5RuN3dJPG7gHUoKAOvTS8FAhfCfKrNdzMXfaajn/89Gj07eMGZn9kfodM7vOdTp
         cKFWNXTCo9H/kPRmlcQ5CwBrtjGRDzj4GbZa6/z4vmAxkxQwhbn6aKF6errfYA+08YL8
         8BVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaSg7oJDMQ4vG7Jd6HKRijt1gGzypyGCnmK66oFweXxQLCpEeGob3r9tRahnuCsO88ZI4gMBLC0Lzo@vger.kernel.org
X-Gm-Message-State: AFuF++my9A+xcPDYClTOwxsHNDeaN/vQYUVLnuNFszbsHBEawQnWMnP/
	zVn1NBj0WogExnsjWif2t9eEANOuhq9vLNK5esVehPuDZxGFDwHe7QHeyPUg9RSdc3IWp2T+yG8
	L3/NL06m1pllCsU0WTR0y7lOQJXYg2q4u4bKBfU2XGYdCRsGq36Rg4cMpqXTbf3UB
X-Gm-Gg: AYBFou0k15e7iKP6Er6pGqn6QXzuuIxk1QKtjTtAkR0chMbuLFwY3qI1BAA88oUaIO9
	GqkT4uJDds2sm+WJrQ6KJM5oD0gsjPZZBssXczEZE/bnbzG4cLC4V34J0JLu8MqyCb/Q3oxXo72
	PIaZpxLeG6TVG5Qxo87vy5mCDYWdbiwNP3Hfesat5hRancx+aBgRtEM4inTVfXt0WI6mkmq4wMq
	8SFBHkBoNv3sVDBGYeOKw6CDXTV+HKBzCTwwNwaWQQ6ZxUgPiZTH77iV5ANsMoOwawokeIDX+Pi
	hX5WQk5FVPeRyduOj77TIbh6lLfr9ynWJ8MgtggsZyAUb0mNxwgRqdC4rj7XsPSnYafgh3f+zLS
	nxrBYaLTU4PCJbv8YLMtFoMo9NooFzpUjb2COag5l+Loi1FpT8dISv+tsnlA=
X-Received: by 2002:a05:701b:4354:b0:160:8d8e:7e3b with SMTP id a92af1059eb24-162047a18efmr6279152c88.10.1791447074151;
        Thu, 08 Oct 2026 01:11:14 -0700 (PDT)
X-Received: by 2002:a05:701b:4354:b0:160:8d8e:7e3b with SMTP id a92af1059eb24-162047a18efmr6279101c88.10.1791447073475;
        Thu, 08 Oct 2026 01:11:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:11:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
Date: Thu,  8 Oct 2026 16:10:36 +0800
Message-ID: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac75023 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=I6E1kIfsyqVcGmBSIt8A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX4rKbEsFioQ+M
 bNFY8CwpTcuhI6i5Qb2DNWicI83VynP/6RrWzCElwnBArFx3OkErv9BRf0fmxfbnj5Du5wSx75C
 x1ZD8A8PJGvuw4SdmkY3AIzmkjzuJqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfXxady3utb60/6
 6IFlTHhYlb9mT/4f87WQzRtbrWuNoR+hhQZftFM8qgf59BaEp7wyPSZszPQPtfcgbqFKCmF0c27
 gD0wGpXNVbFsg/jEaQjBLfoHjTdk1LjI2deMnzgC98MBhhQxToM64lJbxGWh2FeHhm+vv9ff3xa
 PQAlEzkQh3u7EuX1mAA6+t+r/67xqXLTNSyjYhqtedc9CgcALyN3lIivtb1Neksr3INnA/67IXL
 yH7lfycOiu6d3RskihWc77N3rzwUb9kWWndsAfNOnOV4jzJ+5pV7Ce/qEpxau6tjJmwO/VDyMli
 ctdpCtWOb9E53Cqy/Vmbx5B3lVPrAlpfu54ABW8/fBl3k6cH3XOeDlNEnLPIGmZfY5tllPCv+ng
 Nqwqen31mAXarkc2eXkdF7lzFAsSWP8FaxbZxlCHStDN5qbwd6ELCUbnJTWpYwhLLAUurS9gqHG
 cRbnx5hcao14bB/I3dQ==
X-Proofpoint-ORIG-GUID: X6VzYDhdeBNMP9aA4I_NuvoHN8gT68hE
X-Proofpoint-GUID: X6VzYDhdeBNMP9aA4I_NuvoHN8gT68hE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The video clock controller binding describes three clock inputs for
Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
the NW GCC driver.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..62d14be55839 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -886,7 +886,8 @@ videocc: clock-controller@aaf0000 {
 		compatible = "qcom,nord-videocc";
 		reg = <0x0 0x0aaf0000 0x0 0x10000>;
 		clocks = <&bi_tcxo_div2>,
-			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
 		power-domains = <&rpmhpd RPMHPD_MMCX>,
 				<&rpmhpd RPMHPD_MXC>;
 		required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

