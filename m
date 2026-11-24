Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550530;
	b=14EVLG6g6MgxUPxqN5R25Q5ty0CvTSo3/cap2WuJQdE+W8nk4l2NI1ROtyQ6+9pq/wfz
	 QXgdRE1ZqSpxMoJbAUbblmhVKYtmng58DxgGoaYKK7pRGQFoLDsoPn7TYEmvsQms6PyO/
	 1U1UAbRT2LpVRa5kNne/GxTOzyw3VNYcXLV8QUGve5Xi9E+qhy+BKBjzyUMUE1vebTJxe
	 telRGOB7d6fTEDv+2TkTaJzVB5X66A10Yi2w+qR/N5o8Phfen1o+VGNVavN4attl+GUP2
	 s435ASTYmZDdnZHvmB1Cbgf0cGBVf4AN/gmiFEofYfgwFmxryYBbhuRKsCbb7i9eUig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
	b=LJBets3w9FYRMT0s3Fg1i1n0rRxyKDgSb0+pr1WoWyC38nAB/zhUOa4r8iegz4k9Qg30
	 AL7VKm1sgA1stXoGs9TB+OKgJzOO3sfT1RGzkiljDAg3G92bmpODBxXVTO2NaurLOZme1
	 Q/q3e0gkrWxA5VNZEEPvrQ5i/N6KIraIHcpi0CxO1L9oXpOw+Tunzzsl0kL5OM3PTrvDo
	 aY3BPqvj+5EDtqojOA5mYXxNo0id/a5+rZ+jC9GOeHk+WDvIVk6olxQu9WfuzrZZjpTfr
	 8dItdXfgs09ISasDnx4wSAiRMce/j5wBbwMRRiFDw7I7njw79DYcZRg6CJWvIm/L0/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ijRyg/7u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7CUASpR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79A606A33D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B79A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijRyg/7u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7CUASpR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXswK3701688
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=; b=ijRyg/7uiy425nk6
	xxkriXE7jaF7PKGKzLo8R5zD/gKCqdT8L9upLh5FG/xciI+yp6LVEYYjBjMtg50p
	3NMH65vBbw8802dNc7KEML3DV1WVnlzqR+7nsy5J3EccB5T1L4sOxI01vptmiSep
	emKrQC+RgJ8LqFOg3uXB1rNrOWKulpjXyjnovyXYVFarQ8jSAa0/9/Zn+NBKSzuo
	+UxFZ5/gRNKwRQqqOOhRJKKieaQa7g3ikkQE7sJfsScjhmD65/vVODmVvcR4mp3o
	pnUmCAtor+bmy15nsqRXPJ6gNK6e8HhaVI06bXp4uO+wPtfoNfCGDyazclWVKymu
	kQ/6+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7t55w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:02:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d03bfd50aso12851211cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550528; x=1796155328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
        b=R7CUASpRH1XGejr7cB9imMgtuChrdAZjOQlEd24mf9EZ0sNzJ5gQZ1b7DKfVIJVEcv
         40k9U/aVupRB4kDlCu983H94jFnDpAvp8kwv9HJIyMDA07H5Q+Le4jfwc9LmtDPGFyO+
         dJspuWPOBDloCEcZNCNm5jKnjh8YnT2JnlYoAGy5AlRv0LitYYxCNSVHKI4tBAzSkI8V
         cNwWh8oCDdv4Uwe4r1QkRlucjfwERGqVGDUhyMcPkBeAWdf1ZuMZsL2wELpit5anmHxN
         GzAI2LDVDu6lNl61qOpXgbrRkSXnMdtwXXAtHHAtThQmwvWMWuBGnE3VlXH7vVGfLbhv
         mVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550528; x=1796155328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
        b=Q43eVnu2Ca0TDFO3oTxapL4U2jAvefg1Fc4OSAkTKz3IWXBa1rGVLcqHMFsyawgzNb
         IzWaCphYKpz6nXRYkes1vFCyuyEi5FzjutSLwNQZfPmMAFZKABPS+SSdkofEZqUJHMJ/
         K6KFYbw2s+31jJLMgRczE7MAlDEAsrVFNr1iXT0SKCqdOVR2z2Cws+Ma/qknpCaCPAKh
         tOPnrsStdQGEa2v75IkT+pw1jRIXjsD239Ei3osWlMe9FOwLfshNUzBpQPyPcghaI7O0
         60cwkS9tmX61nyJq8a24sBKSzNbh0N9kflcey/c5vsQFpUBkKzKmU9yELM7FHdl1ujJs
         D0tg==
X-Forwarded-Encrypted: i=1; AL+hErECxf1V4uM9f/ugrfe9iaVPEqfiqC59s1TaQKo1heZC2abVGMQts4m62eoTdaqRytNRc6M2Q1Flto2Y@vger.kernel.org
X-Gm-Message-State: APuU4Z9/gYSqgV4ZYaIpA44WTntS3PSxK08bXVGumz4QDcSmIEaXp/TH
	fLOWF/eba2me3YgxQzHPvHvZZnAfXXgACm3ayWyGw9w8LzEV4kzIxFwsS+D/T+NxYWOeTq4yIiw
	Wj4Q9sWkRdR2INlqRE3ZfphQ9Xx5VoJK5VPv+gKl1qduNvI/EnuvojTSR/9bwNqA4
X-Gm-Gg: AZFdTZcNin8pPysRzyFRdrgi6rt2XXuDdqUWrrv64zSjDLOfnLbSXVToeO7oeFa4HvN
	EiieXUt5L1TkfkQuuEHYLTyyIRQUGaBEs0XhkdhB9L+MAHSUG0A7RuQymY/XV0APsZo2M34+Nh7
	wUU7fUdyqAFhV4hWQ0kZajoa7u7rRNlVxCoWo4GhJASUS9/Q/VEb8GZ5UqzjwD7mMKl5mjPcHjj
	AD0+RQNtHcX793q1RBIPQJortdJBrM/DdGpVg1Oa99TxBr+ZfkgQ0rauqYwzvPHc95Xx6X2aRpe
	OksDHcifwxTQPqSYRYmBtaRvZqhAIbJQFsffucv6xr5s0q+l6DYlskhGI3kaEXBwC3Gu1nSaue+
	XlTRpb6sysr/hg6CyuFh8jew4mr4GOujE5NUPKyo6HC7iPmRhjzithcXp2KkKbTq+wrQgfF/oCz
	kyblwm128=
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr2492986185a.2.1795550528223;
        Tue, 24 Nov 2026 12:02:08 -0800 (PST)
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr2492979185a.2.1795550527583;
        Tue, 24 Nov 2026 12:02:07 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:06 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:38 +0100
Subject: [PATCH RFC DNM 09/15] thunderbolt: nhi: Resume the domain if the
 NHI suspend op fails
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-9-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2000;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=VkyXd0QiiEQncfW+Bjx7hTZQ7/bCBvoRe1dG6P5u4+g=;
 b=w4xeWydBj5adKKUqB+y+5tcwfjeukaRXas/yGtt4/eWlBLJ0+XyjsG0TEgr+nRQgr/2bi+iTD
 lWRKVcz/oOXDJ7Uyl0lDZjLWx4f3oivC7cVJnV6F8m77tjvMrYmjYIe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXwn5xU5UyWbJS
 d/fA4c5+y0Zou8e5ayurpt62rVn2tDv8SPUqLtx9kE2q3oS8vPnnlDNPvgtbVejti8/xFFG1Ztc
 vfSpyckyq/jdQo5W+8XbLN95xVnva04=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05ed41 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=kCfvZJGldO2mi53t-5YA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX/tetSakXd0ca
 mr3j49XVy55JR+qEzlFfSxPvyWJFZFCdVpSMYBLlWyA1pOBYJ11yc9sdkfMLTasdkjFPaqqFStO
 jSZnWTNy70VJ89bY0/u4TpD7YeswR+dEQnRbQ455wjrvNUi48kjTsoeCRQSrWbPUehKOftUzTSZ
 mdVKprazRLUm+9zzQe2p7S66ZpJrRiScllFY576PftEUZxGK27PUqebwGt892zgXSBL9Yvm3nR7
 vbhlNn5cQHJcMDhkgPzQmlFbeOUd9MvEhegPsk4z4hkfSFubiKjDz97WKoDTyu3Hl9HBqdjjeB9
 6lK6mMz2NQ0d8RlC3DQhxaIVi5/DyiOMsfklVltlkMrNTXAh/g39q165H40u05UILqgLjF1TFOU
 zs3jqqy+ml6L2cxseSLxrF53FSEqUA8qn9MVkPDip2Jmh+0EZ5MDC4CQ4kjJmPAWHoW8gj02RI5
 bNRl4hqI/WiMt4ON9Iw==
X-Proofpoint-ORIG-GUID: N1Jhmv0C8oZsXYjhXGiC91b6lEirf8B4
X-Proofpoint-GUID: N1Jhmv0C8oZsXYjhXGiC91b6lEirf8B4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

nhi_suspend_noirq() and nhi_runtime_suspend() suspend the domain first
and then call the NHI specific suspend op. If that op fails, the error
is returned with the domain still suspended. The control channel is
stopped and the switches are marked as suspended, but the PM core
treats the device as active: it does not call resume_noirq for a device
whose suspend_noirq failed, nor runtime_resume after a failed
runtime_suspend. Nothing ever resumes the domain. Hotplug and config
space accesses stop working, and the next runtime suspend attempt
suspends an already suspended domain.

This happens on Qualcomm USB4 routers whenever the router firmware does
not acknowledge the sleep request in time. The op then returns -EBUSY
with the router still up.

Resume the domain before returning the error.
---
 drivers/thunderbolt/nhi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index bcc2b959e3b1a6b014c13a4938ed6f68cb0d0fd8..e2578740d569a7ee1d5ab22e8effc153cb7d4632 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1177,8 +1177,15 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 
 	if (nhi->ops->suspend_noirq) {
 		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
-		if (ret)
+		if (ret) {
+			/*
+			 * The PM core does not call resume_noirq for a
+			 * device whose suspend_noirq failed, so resume
+			 * the domain here.
+			 */
+			tb_domain_resume_noirq(tb);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -1281,8 +1288,14 @@ static int nhi_runtime_suspend(struct device *dev)
 
 	if (nhi->ops->runtime_suspend) {
 		ret = nhi->ops->runtime_suspend(tb->nhi);
-		if (ret)
+		if (ret) {
+			/*
+			 * The PM core does not call runtime_resume after a
+			 * failed runtime_suspend, so resume the domain here.
+			 */
+			tb_domain_runtime_resume(tb);
 			return ret;
+		}
 	}
 	return 0;
 }

-- 
2.55.0

