Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E8472064
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250061; cv=none; b=HO+V9w56bdlyjMChkDRkewIST+5r4yDIvHrQk1Kw8pSB2PXz9M2cKA+65oEPoi7PYv96PgSy2v+FLCYf2ceKYsQs89ex0kTyAaIHMb322Y6ulqy57AhGyCgO1isc2D/+f+EryZSWiKYVAxRAFMQsPedNkTn/FJ9a7E1TjBFkg3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250061; c=relaxed/simple;
	bh=w13vuvI8AI1yXKCEKx6VNu/59a4NypepIsr3mLgY1GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Maq5eEpgzn/TfO3rFH6eNdcmxI8BsCS5CR1TU3xV/ItlZXXVg9/7aPtlgjLRtIMvxLO6XIRbE3psl7cLz+quYMgHqYfYia0YXpV6ONXNlJ52AmC0inwtqGVTsK3UuAASsVjUNQ/t4/NYSZt2AIymWtWa5j7A0EtIVAmGgkWij4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgPYzeGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoYP5niL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgPYzeGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoYP5niL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179RWS1811511
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mk39vxOxIqYpN3qZ/D04CiRD2wogB5ytZRkx+4nMg9Y=; b=RgPYzeGs7adO4met
	TylSa5QIS/rzvwjc90oAJw4IbX5OveuiY738CiZst1mpzvOq7sYh5gnht9WEYR6z
	5V/4X8ZU2wTXBT9GltaPZhyFTCNnm7AAS0dZJmG88CdwpJqWh25gXnleYHVelsjj
	HB8sAzllFjG94Ni3InKVAfiBM4QwwT/38FbvU4rxSUYts4AR3vnU3w3EjzCIFyKW
	3MA/g31C8DAiyXQn4HCo4JNN5CiU/Xic/Lt2kZfP/U7WalQeO0gpesaS2zbIiNlx
	KV1AYTlPJLVj041Edd7NiYRR4P7AMojVb7bItq3peBgM7t9GEdtP4rb+4cL1n8dx
	uzXDRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4duq4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390ca1a9abso104705785a.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250054; x=1788854854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mk39vxOxIqYpN3qZ/D04CiRD2wogB5ytZRkx+4nMg9Y=;
        b=JoYP5niLZLkVQWrDEN+7PWda33GgFrkwmCEIog2i0NG8D2LRYT5tLlOyL1gpk1U7Vc
         UVYyK/sA0pd3qCmjds3E3uqjLXvZfuixHG6iwbE/jyiJ2Rp3zWLBpo8cmIMUHNEXLzMt
         e5CTBzINd/tuQsb7LQlEYA3XDaoaTWG1T+S7HRysZ39F+tDplYNBw5FYmCWetsz0tDcB
         2qMuf5lL4GN3Di/aDw9ldWDT/sb8NjHqYOqr4I6d6e9bIvijRvvMLQUvT19/Z+3B4EKu
         dZHMWVZNWVfnq2i+/Y0K2qIV6LsJz6FmSVqAfugcZuvm3InbHZbdo5+lHlm7bwaC/3Bf
         KLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250054; x=1788854854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mk39vxOxIqYpN3qZ/D04CiRD2wogB5ytZRkx+4nMg9Y=;
        b=B3UhLd7jmpPWfnwKph56ocrLGehfxRE8v+bfJQX0OQAiGs21ZZntrqqIFNwENRvqRN
         x/OnGAvNZ/rMZ5tgPl6tpp4cc90RBnt2KPI+ELMgEev3V2lApc3jVlN6i3cyg7ufg2x9
         Lu84NcZgof9cqLBL3sRZzCc69UxUpn+yy503UvshQ1085iNP6xPpRK6YmQ6ELOq1AqsJ
         CgTrmHYE280f3kMi9JHjxX7Bv9mAlg+5dp6Pj9InKUt8ao5cEktB6c0lkv+QPsoSf/+h
         LPkAOnpVVVwCYkevItAhA4VsIVCoqE0WnoMmKHr5GR39hei0bZCoLkIZ3GhkaHWNQ/X4
         Bj7w==
X-Forwarded-Encrypted: i=1; AHgh+Rre9LsakWe5GIg9jc6gAO5oBxqSlmwJONyq552hohEVGkdEX3xVENAgCDPsbiaQyHs8vTXhU13xC3BJ@vger.kernel.org
X-Gm-Message-State: AFuF++nyDvqeTEAicjThZHa0QaSLzISGeVkEZa9rhsTPKZsiNLohlpn6
	/8LuxfclSSY34f5Uv/fE3oZhCIca7BvK6oaYL3SlWJY7iOvIgofXYD0RR7bbON4KWinOXxiiwD2
	VgIlx+0u0dPrYZbhtFWi+4ZTEwHvwQynVFT54Ui9OnSSEVtmS4cfdlUGl8OVRiFNE
X-Gm-Gg: AR+sD10F5JwEw5kgW9TJ4CVyVDszGVHMemRwedk1sC85A3nIeS6AzbXOtFUnI1UFaSi
	Wb+Sos+vnQbFy25rItwR7qZzx0Gx11mr+smWq6u7tvALPatS+3b5rC9dvldNUxlPPNK3e3+MHBh
	4DBLQWfQVUIBJKyjeEN0h23IWYHQmlZ/4p4r2y8PkmcdvOL6CSmKWR/lB9Y2p3OD5U1bJ4ADrGK
	cQcQaXlgKxlbeuKr8A4KqgSaoY+Xwu4mjgqYJQozwQ5VeJYoCn1ACfVwtrED0cTWMG9rcS4KuVK
	jJOc3wIZaLnsg2vpTfbxR5A+gYofuNidWStukrv4/h4EbtwVPVNfGbMNNy2hwyxp0hD1aqynYpN
	SCUEXNkQ+
X-Received: by 2002:a05:620a:7115:b0:939:1f46:3bb1 with SMTP id af79cd13be357-9391f463bbamr2588638385a.41.1788250049599;
        Tue, 01 Sep 2026 01:07:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7115:b0:939:1f46:3bb1 with SMTP id af79cd13be357-9391f463bbamr2588632285a.41.1788250048999;
        Tue, 01 Sep 2026 01:07:28 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:06:58 +0300
Subject: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w13vuvI8AI1yXKCEKx6VNu/59a4NypepIsr3mLgY1GQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloer+Cl7jnYnyw0g69jNKqIZY/ZWHA72gpAs4
 YM2a9Umo2eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHqwAKCRAbX0TJAJUV
 Vj5dEACTG1O78AYAshBkyE7WJgYS68G/foQJyXUEOluDhB3J/0VHlv6Q0K7gHo65XNdvxy6PFp8
 D5gyJofNBKI4ileTmNyyWhY8GymKizM/eS7B8Kf4XY4yOdNehr2qnJnq60cC/Iz8uY2gcMjhx9+
 Dt1EtWOvA0LgcwUc1pvN51bWORND8PzjphpOLs+AwN/8//+UhA7UIO8UCD+bmu5X7c07L0jhK1T
 d5F06JSnwssRkaKouRRAmj11g1e/MH3JTtXNfCJXhiaXHVncapBkVpnlXXFgFEm6WbnPVCoDHRe
 3+EOBKTMZhVdbpO8SDWI5Uyg0mW6Xro5JT1mQChADnmg96VUC4pt+BP2tqhQ6xRgCekwzgleEVM
 aZHi3rScva2cWrjhd0Rmn5xzZVVNgO3pcq04Zr7sMsbLukM5Teo0lh71pKJyaZ6ryE6H95CuYdZ
 IMFxGXmouRlzdoOPL+G7FtcFTBCUQZ72S+DGs2e9PqqEM4ZfjnCWyitMhNXeXG4kMjkH5go0Yo5
 9+GW+JEXmA8gw+T8fXXhev/7quEiObtb8/CSSC3MSO6aeRih1O0CJIY1TW3f8NcgYsI5b75fD1M
 Ih+FZcuqLv4bOKyAKeWWuKsLZpiHHP7BJId/j44gw/QVH2kS1jtQeqQ7qFlO+mjJfwqlqjZXyEX
 zutixXMsmpKIOMQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a9687c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Hz9TZkmbOGt6frmL8bMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX8p8TKmHoYH4x
 NvB8vqNU5lEcky73ZOrohiHx/FS6VVwjDiTbT3+rq1PQ912suRKeCy0bkbvzo0F+ftVNRFfHNm0
 tP5Jclu5xJlRT066PvxIWuPC49DQ+7U8OfYXJrn4rq9ExGX/GL2q54xKvmo7Z/GdCUXDCUgiGAP
 y30obIQiP8dia0Uhd0PInthIxeX02/XW1cbokgakG5weq9WmscJxJ2KbPWkHONnBxQybrJ8EtO+
 zPJp4pV0IWvglrr4k1Ncx4Lmir+U8HkKTNw9K0K48FZKgufE7KY275iECrn5vjZ14C7Cn5FZBe7
 mEeTxDdRzcpuJO4pAxPHi5WI+RWQF6I6FxcB38jAPEIpYnZf7iCiEIY7K7TfeYsgbTAM9525/71
 bedWn63qMZP5+sF2ANrl5bN/+kmrpkJ3acUjCOVbE9/vx2XgpV8vshkICuzse6IjyjP4bMQGkau
 y5e3a4m4gqUkmH2oLCw==
X-Proofpoint-GUID: 5Oy71viaxqeKLzOFQ9HPLlWToUF_jFVM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX/VwWjfmPQoXz
 71vRx+2DmH//aTkO7gtoXxEY8CDpBlNn1qzfrB6hIkdnOkqv3cKn+cpHwhDo5AnmytiSfl8dCBB
 v8wsT+Us/1ritjbUXFHREqni3soO/Hc=
X-Proofpoint-ORIG-GUID: 5Oy71viaxqeKLzOFQ9HPLlWToUF_jFVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985f..d1bed84725e8 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1531,6 +1531,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	ec_int_n_default: ec-int-n-state {

-- 
2.54.0

