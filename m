Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200899;
	b=CCaXkxk0+TDXmpgqg8i/sz8yMY00ACo294/mi+XrCKt2kpDX+VovVcYsN06Mb+PEheVG
	 S2p8VdgHEw1Z4pj9i/g8EhBpqXSOEi6lQlT3Xeo9zPo7bY9JUNWNJjabUpuayQk0Z0eKz
	 SW3kgemAoY/QVSZ5VY9jOQtIlftL7BbyU3YbevJZbPgI7Y2tnWnlnq1BuFx35vXMWe3aO
	 behtQj/wl0K/OMWzncL9aO9rDmLHxpBxj83B5o3GBspClZP3ND7XbajQSzaATC1tsxSf4
	 L9Ayg8E8AdFG+i81OJ7HFGavYPjpatbvcljsp5F8uAQnTUGUxFYsHWFgTd8A7SNccsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
	b=ZDz7UqZ4sTi6oObekvLY++uj0pm1ohrvyyz6pNzlNAndfdpJ00yCRb9Cz4CmM+OzvU0U
	 xdt204e45UGSe7jvHzivB1zRrmiJ9nu7LblYs4isrF3FV3SAM1lcJnovRqb14UOawdn+H
	 xPJltBW4CHhP0EYBktK+SJc1TX91lgK3ihyGKzdfCziq9/9JxIkQi/y2OCI3PppFydOlq
	 umRmUtO9JI24rIN+RS+1D9tAlk12wAWkBp4niL1HpRA+OsERH5c7b5lRRNXicjNEKiB9x
	 ST2Xh+3dSLbQD1lDLVPpLIICLq0vTv7+tYGQdxbRwXqJbAYNMacf3lclYHAO0mbNiHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYyPY4uI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DsXZZ+oY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AFF606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5AFF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYyPY4uI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DsXZZ+oY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAp4R1154504
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=; b=KYyPY4uIeIylLUO6
	z4yl5UozBPzx75kR5b4cgzHeRjWUzq06WCeh/XZ1uQPyTDRpawcbiNdmaM0Irv4O
	ktiealJqOSjYchvjImimcMVMrae2FCG+3frWh8VWOUXetMsWrnTURN49mqxu31uY
	EjTa3drCuebJaazLeiGtFR1utGzzEBcLix7HcvBQyAP3RWZFixGaRfKRQzhIGA8S
	/YA4ctkItgAjlzuh1tq9hB0PB9m1o67eoKdVH2ERkERNRS2TbrwDtQVNX6ocImlo
	sG+gveqs/Nbi2THtYvaxjxqTOGoaoWqBC53Lzdnhtw63LgCYNhiwkPvo1rcfhDZ0
	miUwaA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be34t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:37 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67682d4d684so1787301d50.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200897; x=1793805697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
        b=DsXZZ+oYIA5EC13rOhqJIwVdaGbpuk2eItxHnqeQuKSvIsYXTf3FJhDjcac8ytVNyO
         tDzHTV2JjIIu1xxDvVuMkzAKWhOrZulHLlg8eG35ShCF1YCLPqmXS6fw6Sstmhnt9apm
         rMUd6dr7JV/wQ8IO35bKG/ix53gPSGOKL/2IXj+jAcojebbtfE8nXSIfhGBf+c3wLoDe
         JngPkiDyODbDoQRBP2KxvvPIiFRm1Kg8BJNQHIlmOlFwf7Jy2HZO99AKMAQwluN8cRVJ
         G6zBESe9sBpi9ETl4P7OkgMpGSZJdYFYxmjn/d0qQcJ4NKD3VevpvoXHzBmKA3htiekF
         r/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200897; x=1793805697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
        b=J+nrz0dVOcuYcsJ9EHk7ialmnnz6zYHqZ8F858B6u570oT+ak50725JvRwwpri5tqB
         TOLyztfVR64OmKAwu4WvFjDmiUJ9r0XqWhnkXtIH2Vnqdb/S4QwEIndYT10WECNS9Hi6
         ufueXEbdDLRYnePGm1Nie4TBITEgD8cxUmOcf7bUt/zvMlsNUvpZ/YUdUzWA1ymfRdfK
         bETGwVUAM/bH3Mtna7rC23jAw45/PWZYBJy+fBhAGud2UPDPf87xcUY7lOg1CAc4RET3
         zXWzrBN5rp4p7xzO/Ii/KHHGaNz2wUUT6ckf/+gJHaTBJzLGsuils0sZh1Q6a7V904B2
         eQdg==
X-Forwarded-Encrypted: i=1; AKwUvBwUkRvgoJhXnwpOPKRQe9gk1mDAIzR202bB4diUjTuT1hfQRM9rlIiB0YgK41+80Elp2ARgTQv46po/@vger.kernel.org
X-Gm-Message-State: AFq9FYL4QfRDuCOw/xAKlVKPLQju3Kd+N5uh0sDkqyrZhe7acvvP7nwz
	q+/zEYW1sCjk6vNxNLMWkMTbKnHtF/GKXYw4UjSSX090N3lRrybKURC3dLejCQu7dty/gOd3G3L
	jyVgqLdBpUdQJonEusIqDAwmvx74zVzmresLnaSZhzq1O3dgTa9x9KmTx+JTfz9pi
X-Gm-Gg: AYBFou2+Ij+hXu9OzXQx4Sc3Sm8KWPBhGmyV3coOMe+WylWyMSMNqNL/l1qvzYsadIE
	A+7VM1zm8fTM91O5JlvB4fc2KV4Felo0eE+jrIKrxF8qUXX9vkLuuYpQ53TmTCtp5KttyPRHbSI
	WXas3M0VEeQ5DKJX8IV6yEOBsrAT/LYKsVBYqc20EfvhXro5kQUat4oHv8ucKYuxntvzY2uKH7r
	TMbJ83W0bVz/ShKhr2OT5RKCRPeUylJKoYU+tTybjHdbBDrYNRExHI2T/5r0cSRMAUWnrd3Gblf
	JLsL6SqttR14BnSxz4Y/jqLB05O6z32rIZjbPSv6ecbdEyv3U7y7Vj2WnlNL/jvY0zsvpms0/Ju
	pL6xPV5oxV/YRcN3NFOLUsJP+gLY0Gdv2B8eijMgjAVUkyp5YxbSJBw94oE04YKnAz8Be4WtmTY
	u7eThDg3x3iO/cuIon1ntzJQ0BL5i7Cw+9coLoPBb/Jf8nc0cC3mamIeIzJbFi
X-Received: by 2002:a05:690e:4844:b0:679:a3bc:c23f with SMTP id 956f58d0204a3-67a7bc69839mr1147873d50.39.1793200897054;
        Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
X-Received: by 2002:a05:690e:4844:b0:679:a3bc:c23f with SMTP id 956f58d0204a3-67a7bc69839mr1147801d50.39.1793200895124;
        Wed, 28 Oct 2026 08:21:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:48 -0700
Subject: [PATCH v23 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261028-kaanapali-camss-v23-14-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: yXzuWsgT5dafaNGa96gckyERE9QjLIl5
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae21301 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX8JLyB3wbcC1j
 kdekdz3lVvYcIdACfeA6dhUTHp8fxfJmtZ+bQv54IihK5XPqgrLdGJNi/YvkB8AeNFPGbnvrqCp
 zUWmrv+NrBjyxrK/y98S4SpD9pVlO6c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9RMFsBsQokhL
 fyvxBXsrtK5iqcSYhZQIoA/fg1iMHMuQlbiKMp++hugAOgwV+oH908fbYkj+z0o4j9QlzybX9BF
 K71vF3UBTDYHFa5QkJI1lWvLbY7D2faGC7niiD8O5lty4qSsC7DPky0kb6lamjfFujWq7O2J7Ez
 Qn8ssdWZjnULnvODlabAIWtb/FKEYutAzed9+qThX3u/v5kGsakAYGHEM9Oe+NDyvKif1Q7DIzb
 vL7QDoo+FjUWPWe3HJu7Vqiymb49cufHJ+rTWQGCM86sLhicF7BzTsTLmytpTlYIPeVrTdJYUKE
 /Dia3pW2Uz71rrZ8IbfFjD5apOzhcWULtPSZnAsHQ6p0BcfZ7oj/ZSVZD+g/wBb+SD7hR+P3+Pr
 zynN3QP4M+i55his8GobiUfxl0fAQCPeTNYtjw44LxQEM09vG+rM4tTt2rp7kCXm1p6ucL5LqY1
 k01y4K4xjOVYw0V9hxQ==
X-Proofpoint-GUID: yXzuWsgT5dafaNGa96gckyERE9QjLIl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bf3922f0ffb3..3f28f279e4e0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4647,6 +4647,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

