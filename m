Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800957;
	b=DgAme+Atf3DneaczTiYLGSvP8erHJvYo2EAGZP/5ii+sH9wCNJgJqH1O4DCLz1cUCybG
	 0XJhPSgccgPkUzHNf0yT7pjAzj44PGMd4JStdLJS51Qaq90GM/sH3LpSkaqr+Oe2+nHUM
	 D/unjzdYUgTY+opjiSnu2gP9zDJdRxETqAxRP8ZlnCrXaC48v73DCGQJh9slL4F7akPGO
	 gfoqTMn+UDTsiNi4I1C/yuyw4MVU36BdJYx/B/KVXQVW5VvI4YG08t4i/HJY+eED7nATb
	 QF3kUVTLpxYShgwFRCdu6LyekaCigevlJnkb25T3oCD5GjrbCVaR3AITIwv1iw6A/zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rbg/EhXUWMGD0MjgA+iY2A/4qDiv5VEoEsvbMhBTkFo=;
	b=Gq0Wqf3jYmnmP0uk/7vGR5h261EGq/g+yNhzR2lbjr1GTzFK2UmOUFid0Vvkk31jDjJK
	 3wbRCUiWUKPuQ/mvWgM1B6pb/jITCFQZaNX6Qfvdm7MeBn5aN4SGgAmJaRFfkdkKQehKm
	 yO50TK663ZkWdUl3lxj+nmZ4W4NY2BmyKFHnVt+pN44Ptz/uztJNnHS9MrMuWM6fFF2WH
	 qHGD2r7EqINJYNmSlkqb542aPjzWBwvG5/rLxTGq0VfSvt6f1ujSGWt5PlxKlAVq3/53E
	 tifnBqvEArG+H3aE4LMbpkvyUYS/s9FC74UUVqfHmkBA5jqsibzpsIOOb6w/kLkZGDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gLrE4lHE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DAOQQGvC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67835606A33B
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67835606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gLrE4lHE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DAOQQGvC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LGvd3788016
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbg/EhXUWMGD0MjgA+iY2A/4qDiv5VEoEsvbMhBTkFo=; b=gLrE4lHEFPQuTnyy
	HY6XuOE45FCNf2/hCzvME7DXViglsM/+LS+LNvH6zPowawuyuiYYcl9fpCv96ear
	XObzLAtemkr0v7nU4HdauY1KLWshg6w2/s/brhcnB4eVfhmhpgl6680zsqIlU5td
	ckqL0NB8c69+RcnW7kGgfGW4jrP5vWKzw/dWp1UUuDsz3dxRYh1x0xvY2jZ8XExN
	kQ7dCfFsf+NW3AJliE+J3u40aXync1b5BES9KTuUMyKiVehbEeCtmIxhMfko8ii8
	uMktf4GkPOfNdksaL8EZhTVYwQ+EhgfJ/NDLSQ3m2ydVvj4YE7uJ1Yhn4wjcV8vL
	o8oLQA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwchka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a7de733fa9so3739981b6e.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 19:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794800951; x=1795405751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbg/EhXUWMGD0MjgA+iY2A/4qDiv5VEoEsvbMhBTkFo=;
        b=DAOQQGvChSppmeimCdVT/mz/viLCcQS57A3Fl7wyHi3TetFkIbWkjW5ufbvfMbd2zc
         U40f+GKWSKigcZ1n54ET7TI7heRWP4V3evf/mjTW/baUyXl42KoGQ3eGPzNg76uxx3xK
         mZ4lagbNhCLCFxhf3s5LxYjC4aQFseV3nvCRuecgT4IDu1zkmTBhSKXczBFH7UpeQpqC
         eK3M/C4Yj2wV90EEeQ0EdeF4QXaC8sl5IVVrCSNpKH2UFA46hz0er5uRtwIP/s0Bq2xK
         AasOvDotAN6NCtD+9p6EausREX0lHFDlFHT5niGU3CEEIPmIQYzFgezjxWuFHUX+OhfP
         uLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800951; x=1795405751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbg/EhXUWMGD0MjgA+iY2A/4qDiv5VEoEsvbMhBTkFo=;
        b=U4y0cr4sGpCgoFh3AkS2Rb0V1Zl+3mZHKt/xssDo2LewvJ4IqOIro50cYJzuwAP1U4
         pO+BjNaM836/2yVlQAawbR+k0phLyeaCdm1NEqeISHuOJ7firWzzRNds3qhCaN5WnHUh
         jdhOnavk0BQoBUTwNMsFe2GtAMjy8dzcOzpXjOUX9e9VThe42BkYKANFtQw1RXatSbAg
         ya6o57GlGlxdOspgqTSskQXPbfeyMRJMWkJWEtY/rKBVOV+SNqqq7O8AUNtfgxKVMicR
         s7U1WsvRB9beK2+qe5E0IFaKdwE7JMbaRLELuoGu6qb5OYzNOv/wlFTWH3gkEMl03mP+
         sxtg==
X-Forwarded-Encrypted: i=1; AL+hErEyWPUL6j3vwCvGARd1WT+XMvlJmdn0U5uVfuNzKXg0InytpBI0JsrdEpk507b+74RrKZ5mGm5SQX80@vger.kernel.org
X-Gm-Message-State: APuU4Z8y9MOzHqPlC6O+2ngbi8P/E93wN9oPQIZoZVaCv5HPND8c1h20
	UNEiJhKohbLR3TV+FcMQTSbe9lTCT9vJEk2UAL6kF2INdznT+4Xahg+X3+1jaGhe64k1TdxvG0W
	9ThU/O1GdtkDe36vQhLXdnOiSsEdxbP88GA9D0/l19bi+WIikwmZ6tpOujBL768IB
X-Gm-Gg: AYBFou3ZTqAXI+QSIdE5gQKXJ8Q8Bjf6QrI5GxC0JPPP7qw7A4CHiZuZG3k9Nw2JhMg
	gUrEBrZJVxC8qXwXjKfI4S/uk9nLE/TY27NRA0Rg9wR3Ifu3dHkKPSK5KcGa2lotWoJ6L8md4e+
	epSaRP9FJ5KoGH8N8pXacKJ5/IouKsdQya+bMrv8y2jslRaCOS3Gk0DmJYoKQBK+ADbyWSsUHYr
	9XYuGUFY7/svR8VSuTWzXdbIfIQ5IGYR1Rg/VPx+YZfdZ2KDC03S3PwrvVPx/+1xkyVkng8EqAP
	6pN5QuMXjMUdQgDBIQHNC486mnsfEkidS9L2jzOs/6btlSCF9Mw7EMiyueowMX3EDVbU3KkfiWk
	gg+E+ngXeeUozqKnQUq8ocFdOTwW/zKgZBMiCcFkeZgqwwFZqymCHkUWvoh7J5Ro85sk=
X-Received: by 2002:a05:6808:1782:b0:568:e61:dd02 with SMTP id 5614622812f47-56e645d5bbcmr9600327b6e.43.1794800950637;
        Sun, 15 Nov 2026 19:49:10 -0800 (PST)
X-Received: by 2002:a05:6808:1782:b0:568:e61:dd02 with SMTP id 5614622812f47-56e645d5bbcmr9600310b6e.43.1794800950255;
        Sun, 15 Nov 2026 19:49:10 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm8903234b6e.8.2026.11.15.19.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:49:09 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:49:01 -0600
Subject: [PATCH v2 3/3] firmware: qcom: Allow QSEECOM on ASUS Ascent QN10
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
Message-Id: <20261115-qn10-v2-3-19b11603e776@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
In-Reply-To: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=930;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD7RN39AiqmPzWM9d2IKsg92WDZlgjc/n+PPB3RMaNI=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq+n0xuqSheZlUBlTOgMxGZv+x2tTIsdOoRmSxH
 VeF8VegwnmJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavp9MRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXzaRAAhYxzusOCt0O/iwcebQHLdUWoczYn6Fumkr+A/m5
 1sQnPPCbT6QFpmppnzTVCAp/Te5uo8DFyDgcasj5tze+ca2O9zFaGBYqC2Ge6BM2cJtREjeq7Lf
 n1AoJtZnRF1BNFRfoAOPlsGpX+Khg2SMM6EaaSTb5XaE4lubpDcfHOEdvORvNi9J25P3PLOMEHc
 9Q8JJqzSLFs4STMHVSMCRv6CX9vgju0MGV7oxhzt/buAPrV6aUFe6zOPgzmbQg+mnJo1u515x8n
 hQYXmJdriy6JzMRaXTvBzlGCrCM2V9hV1c1/Bt6Vl8ungPKAQxPXQHiyIar1LG4AHqKZiSyzNsH
 ad1yl1A60RK2vFP2j6ox3FlPH0p3mX72NJgHR8Sv8rkeproJJvlF9k8vpKTcCJEvX1yCn2HAuVj
 yteTupb5txtHG9ZoxAYNHp4hdMlEI0TCv1bjief2DMWv5U2ma+bkQtsM3fBxbQ4ZACceNvK4tsf
 8nhxgyEghvGe5WB3wVGpqQKb/7Yw4R/2ehd1542ZINyq3C0SmYFoiVchCzfJ5BAms15OMCWLIq3
 pdN/n6fIp1f923D6YgZsitn7drfW++9hUDznJwFtMxDWUdNU86yoX1lGWu+ygUW/0SwyCV0V82i
 owFqE0SzkoxGIh9ZzxpmRsoEm+SY7fEshAMGaPZ8t4jw=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX/Ay1m1o50B3i
 4PlWX9sUb0A1j6d3wpCbzWHiMkXBJSmWDe/40djYv1qOguICd4/0JmlYvRTJp6P7QA4KqASjsZ8
 WV9N2dhdzdOcm2r32xuePnQEGK92v7IhceVUs0bz3arxzV5PYnaaymbgYTHZQIPfZCkhYr1IEh4
 PGjNFI2GERwQWHeC4FQ0U5biOcNcVwc4vGy/+SRmPbjWeazPPXXahVlrlEQsvbUleXhgb0I/5WD
 EwzdQoofxQfyVch+7Plj4orvTiTzu+fYiNw79oWjWRU6ERa4wiRyXGZGmphlKx19todx0Aqn3ep
 /cMKwYaKyhcbsxIv1ym0Ocps7dZFIRkPu/vbF3Xe05mwnpNn3derhHKPYKNLlBGQBOQwXiwh2yX
 B6cF6+G5SWJ3d1bjkzza6hSDtjacw6Cg6pNe3KbglLHEprB/XsLcxSXFChz2HT8A/k7jSjeHZs5
 94LNF0tNcYYjGpknKXw==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa7d37 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PMzojMwlkinoLF_R2aEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: Wd3H-M-aCqTaBKG5xkSmR_5OhsP7x-IK
X-Proofpoint-ORIG-GUID: Wd3H-M-aCqTaBKG5xkSmR_5OhsP7x-IK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX8eiMdCI0Amvi
 hnxGC+VHYTLfqEh144wOOuJd+lfxg5Q2OboVlw+0BvURNPQ1339AZopp4QGSgkTnfnXvxzn6Efj
 Z4a0/auSPoDoIQNnkdPqSlXhQqNIEYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160014

The ASUS Ascent QN10 provides functional uefisecapp over qseecom for EFI
variable access. Add the board to the allowlist.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..fa94eaa020c3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2226,6 +2226,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "acer,swift-go-sfa14-11" },
+	{ .compatible = "asus,ascent-qn10" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },

-- 
2.55.0

