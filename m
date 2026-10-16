Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6EC494291
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194917; cv=none; b=tMZR/vLXnpXIcsOc38QoD57gUtOHsOGJWlV2rglWuVCYqj/xT7dT82rAhrFm1CM1AWSmC8Ml8hG+4HdELiBRBWpifWcvxf+Dru7SrtcCpsLFDVY1S4+NqoRwWzAnFvZaGBRfHXh6ebTK0HJfGIkoxph6LxEr8eUhDNvHICUqml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194917; c=relaxed/simple;
	bh=bM9+n/kD0gSlP/YIlU9Zq3VTnjdW7BpXbunLA84ef3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fMBRjhjmOTXQ8fIwxvRbVvYdsD1vGe6tgFIqBCziO4WZxoPuKiuloTRnWxLka2oUKy+PnFuW9irwR2iOhcvAyBi1a60kZpjw7aAMC58msjU6dJiJMqssree4WTsS3n8SpcFU34gEX7XkEbe/P8OiBiQoDpp+E1IMxt3Zje0S1GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7FkmJl5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VS37Fqvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7FkmJl5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VS37Fqvv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFHcY3664318
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZOY/FRwkyGg
	4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=; b=e7FkmJl5PGKkkeVXy3BFWbkzlXc
	29Hd0SIUT3Yr5EpDDf/FUnFFJGLeGrwQ+tImKWyHAH3TY09RmbaSO5j1PAOSzprI
	/QZY8W+0EJb8YhurcRF9WVnfFa0D3e5uYgsuuqRTX3ErjH37MYyUnChKqrJhJ/DT
	lMBKvf6MJ6R28f0ReXH/R1phY754nptRPAVSRG/WFu6oQ9yBeyQmThtHMhRz6ecY
	FbrYZi2PIS5OfHG0JMNljKW2TzPl5nObNNY1cAAaTPUykES+xhDcE5I5CF9kRJtZ
	S3c54f1Dslux6NKA2fqKTGSSITC6Gp/ad14UMBPv6k7PR21xx5cewdNiATA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrwms19y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:55:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso616591eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194911; x=1792799711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOY/FRwkyGg4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=;
        b=VS37Fqvvh3hX/KxFDRW+fwucU5tKhA848M8R6ZSppEheMVBoGaLDGU9L0bOdIfkiH/
         jB2pyI9YauhwK9603BiwcGjm/n1fVX4DfjjYDjuTbjX03fhJ3waJUv1xKwJ8b70qAkqM
         LAXI9ndh8+9Cm4Wks79Ci9a9KCLl2Q8N+VnNLWOwD1YdvwfhB7fksnhaZQ03MsWWbIGZ
         ILv3G1jcQHKlrFiuJNtsJEqpDka9beLNTgnVwLY3lzjT393WN297hqcXJos774PPkv1U
         gPXd1TtuY8MGF6isXYQ1u0eIJ8EFOWy5RHY+rS580qax0TNwKX3eoCJ8f7mtLC5QtyXq
         Durg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194911; x=1792799711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOY/FRwkyGg4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=;
        b=ehiZH7FHr8rc7gCAKxKpHDidYraB0P1mr6VViwSEm+OVFRNaLtIAQDQcw1xPZILfle
         7JfJSgJWCq/v7fKuKEc1klIzQdUBVt46kXneM7aP1Uwnxt7nzva+KiBDqga/hIc+IeKY
         2hPSeC4Z7TMzeTQsLtD0ZJo5T39+aoWgQaGRVHdTRlmJfELlRRETSPqu8TWp9ulP9rHU
         gkr8KbBH/U/itsgjujHRVB4i5RVTgjB0THv2XmCa+budkKZibI9A9welFr0LKiOA+178
         Gagp3wPFiTREsUqaIstpMtpY17bJr4S8OI/0JD8Bgta9NI36eumbAhTwKstWbpqUdDOz
         JHjA==
X-Forwarded-Encrypted: i=1; AKwUvBzg3SDRkz2fCEcuHf1rZ7g/FJAT3dAscbAoBF9DdgpmCRJHwme3MmQnqV3iTjklOyuadRQHv2bBnSzs@vger.kernel.org
X-Gm-Message-State: AFq9FYJNbw+PRBjd/bFjnBUmuZANvyWsRheJ2/ZTNOtgZ/vdi0spFieR
	7R+kZr5Xn5MZLiK+jS45jwL4dCJnobTHM6ywmGhL5GsYgAizrtvBRe+y6gkcQMBrHBxaSRmdf6Q
	SFp5H1bpm5cIIBHmjvpEBviaEIUOhrunt9nT7Jk6jvSrd6Wi4JinLC+WCmsOUMrrH
X-Gm-Gg: AYBFou2IE3r1vdaHgIf6wSU2W68WSYARvtpiDAiQgQQD251eeYcMwa92bY3fFX0s6B8
	rfQoBk2mfaBCBpWq9ekIJuQ9Qzt/spSWs07KwHf4PNMrfH4ZJAQk7oYh6OvJ2xNqtgEM8KucBEa
	g1v8fpmwhG9FKnnB5jJENHbXKmHqKtO/0E99nxCJNQb3MnIO1b7oT+a2/xwUWTFTPdE1LClsgNJ
	FB3M9zcEMoEb2fcB+i4n3WCX0thWKlyQm0bMvYwZKx1JmdtY8OhRzJ+muQ7KLPnf1I4P8of85mo
	pWvzdL9E2dN9sAMqwh7DNlKxwELur+RCOS0/YU3WqAmnuE8aJljTxF5Hm4ZN0mFg88GlphCY2Wr
	x5h8erDbYViq3TyfiVSDVZ0o58GUTiixpWaRtmE96qU3BGP4ddo4p1g==
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr1615135c88.19.1792194911105;
        Fri, 16 Oct 2026 16:55:11 -0700 (PDT)
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr1615102c88.19.1792194910530;
        Fri, 16 Oct 2026 16:55:10 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:09 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
Date: Fri, 16 Oct 2026 16:55:00 -0700
Message-Id: <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B4osQ+tM c=1 sm=1 tr=0 ts=6ad2b962 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sspf3fhusXUOSPWbX3IA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX4pBdL8aMEL+r
 /eod+cK0LYplzoPm/hUtGYyTO23SwTIHtEmNTzlwxk5sVJ2eLbfMhUKbgWxfxHR8YgHg0ahlatV
 b9Hgpsp3HT/yevYkQutuIH+JAC6aXT0Oxa6nh7/aDqBu2ls/8WTL7IQuzabKpTl0uS/z1u0dKeX
 T983M0YW1xo5XNlcGJV69p/1e8st/CboggEWUqi1SR1FPY1KLZ3zT2D79iN5pgo7u0bJlJmz954
 U0bv/wJmjYoZp3EbFbLECU3FVNxL3GdseIoWRSSY6CV/f/xNC17TDKmGeLpJwZqPT8l2Lf+S+Ld
 /ZTmbcDU5zbUzqOWSQ4+ZVk6l3qrmCU+4wc5wJDkCh4ZQ6oITZJzQr6qx/sRXeBNUH0pdDxiONm
 emttiyvjNoJqwqt3giwHoUExHEGe6DmbZGvsUgX+8LpMfAzOn9B/BIM0EP4YSC/C+Xjs+s9Vfs5
 WiwNNpjf1+Gei2Z4VlQ==
X-Proofpoint-ORIG-GUID: brW4m4gJ1IR1yl17VrGhweRFjycT7zyD
X-Proofpoint-GUID: brW4m4gJ1IR1yl17VrGhweRFjycT7zyD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX5xn3zWO3NCgC
 k7XG/IXGzN4evd6MOClQSt9dW7XQlYH04iagpfWH+5zEqfYZkaEOSP6ATMCNRymZ/TNNDDqSjH3
 Zd+dASFj4MI65dqCss5oM+cUZEDFfss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

Bind the new "qcom,qcs8300-csi2-phy" compatible to the existing
sa8775p SoC configuration (mipi_csi2_dphy_sa8775p). QCS8300
and SA8775P share the same CSIPHY: in the legacy in-tree
CAMSS driver (camss-csiphy-3ph-1-0.c) the CAMSS_8300 and CAMSS_8775P
cases fall through to the same D-PHY lane_regs_sa8775p[] init sequence
and common_regs_offset (0x800), and camss.c gives both SoCs the same
pd_name = "top" Titan Top GDSC. No new register data or power-domain
wiring is therefore needed; only the compatible string is added.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 821c6a0a916c..cef4a90ca539 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
-- 
2.34.1

