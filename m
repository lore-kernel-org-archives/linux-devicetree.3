Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998035;
	b=E0M0QIiBY46OLilpkdnu9sSqKoYTgR0RpF1GGLIowVL6qG7mH5CiFI32v2ltP42NjtIy
	 fhlJiB0ZQNE2vKKgPw8+JkJ71KpNqVyO4J1Z/NGo3TIQsygILUY7W7cqt/Q8kQFmedvDN
	 cAcRc6bdo2wVVG9TimJT/qYyavmVwLJoTmfXdaikR6IpVc/pqnzBAslbauMnZ0nzZLRpp
	 2/vRcvFJ3WrHey5+zjyxFvW3/qBykW8LCI9lkbxz6z2+f82RT/TFYCX/fNsXzgMrFxb8P
	 o0i1nmP1KyI/MUa2OB3NUdRVbtsxycO7Qldf/pKkjmH4TwArXCRkmeM4dh/hF1+gVgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Pd5LgaxHszkkaVOinhGV6O5N+YV0rg18ExH9Wt2rx5k=;
	b=D9dTDCisSQwV0Z4022bRiKiBPEb2BXBSyUoWDLQqKM7oeJmIX/WeCmioDo5BcKbdn3wG
	 Lfh2zXrUq9bnQ7/sbJzK6eap16U99wSYWvijGEo31QfOcBkSoC8eLJQwha/kIZXhZd7EI
	 MC4OKOutAcPLdMKa8LWzJCtai0cvgQNO6OoVTppX/azacDX35fAZ+1KnC+9jfdOBgINmz
	 ZlicAM27A9DE74xA/qN6KR7Xtfiq4MdmJzl3BYFG0jn2VphueFXzTPWZ4v4Wvou0qhzYg
	 6CQu/BaOxMPvy2KDMvCZw/vRY+Tj6jATrsk/8DzRJITeerqLhLWn0XlYsGWL7pX+JjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VG071e1p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxVJ9hYo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC10606A32F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 20:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC10606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VG071e1p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxVJ9hYo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JL6D31699926
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 20:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pd5LgaxHszkkaVOinhGV6O
	5N+YV0rg18ExH9Wt2rx5k=; b=VG071e1piR89hbaPAli8Ro+gar5YeuuVloMeop
	dAo751f1tpsTCN4Ss5NrcPY/gOXeWS9qfzWGdtCwv+frykK15XR0pCCImRJA3TwT
	SapJh7KYSwEtOwWj9vgZKplnxeIiAb2BFijnivngw9/Ia2vpw85+bH7x7OJk6mSp
	38UJBweMn31e3n3fCk0I3YiEQSo4Q/lV9L4VOgRiaeO8fWKIFuQSumf2fOn+J7L4
	1NGpctZnldYDWP1YIFCbDLxnrSSefxEjtdEc4STS+n4L0YjQHHxKgx4WfjRT3H5W
	VdBQk7Myy9X4CF0qEwk/WXXa7g7KYZEoG6ocLgzLIppjANuA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmypga50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 20:47:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990c957f129so41751241.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793998032; x=1794602832; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pd5LgaxHszkkaVOinhGV6O5N+YV0rg18ExH9Wt2rx5k=;
        b=bxVJ9hYoXUpTTGzvREVBxQOlMpYkjMAHUqJr6zoBfkRkJ1dZKyE/uJQ3AFVsAwQgWh
         FJ/Un+FiWmhb4nBj6Ma2nmjP6qd3yrfdtcFzLjDXUZ1bpAbgYe57FOSEzTk9DwmspJiw
         WoagMWwhCJCGd5QvpR0ESZwXM7ZQNEzJasijhgs7l5+KScu+SXDJU4twbw0Tue5hzkIG
         f3L9e9ipwGzcQHKqYPYKzUMWJxNxmEGBTNpeOqPPfPJ9YM6aTR+GJczrpZBdzUfbBMv4
         fGIDVDYvcEJM1ienJPNtsIh4xAFNPmHtTsAAuWYFH0989xjgqcYAEC0fOucBhG1U/PcB
         CNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998032; x=1794602832;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Pd5LgaxHszkkaVOinhGV6O5N+YV0rg18ExH9Wt2rx5k=;
        b=sUYiFrKQjSe9p9swN/FZCNSn5S7+aeNjhrz2YUKRIObm1xml3OxcNH1jLywPkn6914
         S8LfL2/uTJQ7PHJlk0IXATX6AbP+S6+JL2lW5xsxLHXNRs98I5JFZCjH/dVV8d19l/UT
         UuOfgde53gSkSFtZT4swTAzTo0t8Mo48nKcRPWb8rcENtL/LUO6VMfDJG38SzhAEzP81
         CcGlna9r4ZCxUk1q3pM0TXjYtEbGCcGJmgthihR6OgWmJLWhmzCYNHwVJJGI/+3T7RZk
         ydBxfmVbzpMfW6hQlE8v3qWKHnserFyb6+DCfyKvZ8tUkTU+8hfBPYmQR3VFO9pbluxf
         8gwQ==
X-Forwarded-Encrypted: i=1; AL+hErHGaFAafwxuaqDPOafKy1JcRo/DwyB+/o5chFkTrlABjrwc8wrXvntlfmO53l/H/dyJmwfwXsbOuGP6@vger.kernel.org
X-Gm-Message-State: APuU4Z+B7l3zGNCw6ijwEt7gmULQHsbOzQTQwjHbQxk+qwdUNlo1Xaek
	cLf92Ras8k3KoYZmYKSOdQs2zs8QrmhQlJtpSRPwsmapH84OXsQeiYxTqKU/YN9LuizuvDVBUkW
	RIxZ5yUR9LRKg73DKJtPrI+MdWrS82ss/oIE3fW8qe7ZUZsgsXjqTw2623NYgHV0v
X-Gm-Gg: AYBFou2aVsTevMK5T/gqiertf9cIwX6+nZs2uFQE7qqRWP9ayzxadkqDBWJm5zp4dEy
	4/TUFOr5ChpgFybPolU1co9vq/OImFXUvE8NK0cJ41ulNu39fNtyBnBH+VTPu6mVm7auvzyDARf
	iNhMtSoV1v1roRvm3xoBNzo7ioB/JI5V5OKA/OqRWm+7v5iIxHpLYQftcp/GwH4WBk0+HrGPxGI
	cdxHy5jPWzGO7nELMy1E6P/VxiaFzhHRwymJBjaRcTvD2XMLzkUdYEwy/ig2vN/tVDWv0gCFMmb
	rbl9r+xj95N7dYN7x9lxP6FelBabXAgQvzldIzhs2x6VaIUPhkmHCOnRYaK8gWbFpOkQBWZDssT
	zo3HnXjGbrduraXFwgGpd0/mURnD2x+LX52hVfy1gKLyBIWbXq0m3y8qBqQ==
X-Received: by 2002:a05:6102:605a:b0:7c0:115c:14ca with SMTP id ada2fe7eead31-7d2bd4be39dmr43680137.5.1793998031997;
        Fri, 06 Nov 2026 12:47:11 -0800 (PST)
X-Received: by 2002:a05:6102:605a:b0:7c0:115c:14ca with SMTP id ada2fe7eead31-7d2bd4be39dmr43659137.5.1793998031234;
        Fri, 06 Nov 2026 12:47:11 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d6085asm7845292f8f.3.2026.11.06.12.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:47:09 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:47:06 +0200
Subject: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 touchscreen support
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
Message-Id: <20261106-mahua-t14s-gen7-touchscreen-v1-1-d638ddd34170@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMk87moC/yXMwQrCMAwA0F8ZORtYp8bNXxEPXczWCHbStCKM/
 btVj+/yVjBJKgbnZoUkLzVdYoXbNcDBx1lQb9XQtR051xI+fCgeszsYzhJPmJfCwTiJRBwm2h+
 J+34cCOrwTDLp+7dfrn9bGe/C+VvCtn0AO7BfY38AAAA=
X-Change-ID: 20261106-mahua-t14s-gen7-touchscreen-9f6356c88b96
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=uKb7Z0+JmDuO4iTVpzi7GYs6RA6GLHZkSajItq+0Vqk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7jzLyxDrKCtIpsWbmR8hpD//DhQLa+sI6PadM
 DKdDJpQY1mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau48ywAKCRAbX0TJAJUV
 VumYEACRN9VbJCmCRZy3J48Ltaef9nftxJzE4MFKFaWXGwsTbXWn1KGXabNYVbt6GiAQFhdRwtp
 PDqyH128eFBBF5T1K1cQqwsRBpQo8xO0cBb9mCdN815Eq5gCRTNPs2ohWDX6/XqzTZVJ+dBPka1
 +w7gMukbH7KqZU1S39uxXCGmedN8+GPNY+mftYBHKB/O3UUXocsiJohFbFKazbf3/TEdtEqratT
 aSsut6lfOrvqediQ7uI/ZtEuLwOrILYM+VbQe88cmYlDfff6rQRgqte27Lk0Nfk7KJf7Su4WKMK
 IQCSgGLiucgIbAWCMfMxFBpRP0VKjJIvbnv/avEFpA/MTKHr+tJ2MnWUB/J1r5PPH/YSMLypyK7
 KPbzwf0HFxlYNQOok3RPPAIKc1QxNif8kG/B/487TFN+LeOPQ52sEQph/NWxu/BPZou6kiohSjJ
 0HE2pkexWyNLOD3rKLFCOApgpuda43nAZD0yecjBXM4vH0lbe8b0zZ480xlt50I6VKyhA+gcX/1
 1cWJrVqA3fMMh6oNtm3HZy8il/AY17JHJFCXM9t1/X2lLEsSfZ5QE+IsuxfAll0H+JJHU6zCuYy
 pm7APXp7v1LgNDqs8Kdov7hON9xbmoaom+L+E78p2nxAVcxyJpEaFOQxUfQa6ASy7NZ6d8e4ztX
 KvmYRI5HV6FsAzw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4MiBTYWx0ZWRfX3VHBPI2VckJC
 Xfh64V5D0QdjzB1+xaV9z4Pnf3Szv4VJszDFNr9Q1Bp0PdXC1yivqt4SiXYqN1fdvtBj01wBMNy
 TbBimKLXvrF/NBXREY90k3YwuKIcmntbbGqu8KDpG2NpxWKenTdLKg7bw8ebhAXIJ9bboSRVbGL
 AuTV/n6zYlvzxorpmctCTXP4A4m1jAjt4LLbf2f1dUSq8k6CKKjSVDtHA2v/GeH1E7h722BWT8V
 RrNdy7J6ptlXaMWxrysvgkdeRCJBIuZlUL2JdVmL8eBJY/Yb4z9kuVRT8LothAAt4URXTO322G6
 Q3Jt2V80uzuwtN4zz+Zb682FzCMw+QndRKbR4XBpr9/r4rH3jizuQkmh8Exf3+EGya3JTi+G7xS
 OHHHcZfyvA+31U3NNs/WPfmaVR2vKjHrgAzb7GycozgPzKKesMEAphj8885z7o+KO/tTmAaYd5N
 keHV+FdWmgTFWw6GsiA==
X-Proofpoint-GUID: M_XPh1S3JxyJZHWd9Mgj2LH49r2mwEwR
X-Proofpoint-ORIG-GUID: M_XPh1S3JxyJZHWd9Mgj2LH49r2mwEwR
X-Authority-Analysis: v=2.4 cv=TZ4DJhQh c=1 sm=1 tr=0 ts=6aee3cd1 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=U6BFw-rutseXiAtYHe8A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4MiBTYWx0ZWRfX8dhI9WXoAlFB
 TG3sZM4VSyY8KKaw2C+T56Z+Taj2NsGOkDDfPn/9oDw1uKidEEd6pKpyq9x1VKBFGZD4x+HW+ZW
 5iMigIoo9pCM294aj4qcDdO0KNYxMwk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060082

The touch SKU of the ThinkPad T14s Gen 7 has a HID-over-I2C
touchscreen (Parade, HID 1da0:3009) at address 0x24 on QUP i2c8.
Its interrupt is GPIO 51 (level, active low) and GPIO 48 is the
active-low reset line, which is kept deasserted.

Describe it so the touchscreen works.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..f19ec3aa89a1 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -735,6 +735,23 @@ ptn3222_fpr: redriver@4f {
 	};
 };
 
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@24 {
+		compatible = "hid-over-i2c";
+		reg = <0x24>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -1101,6 +1118,23 @@ tpad_default: tpad-default-state {
 		bias-disable;
 	};
 
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+			output-high;
+		};
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-mahua-t14s-gen7-touchscreen-9f6356c88b96

Best regards,
--  

Abel

