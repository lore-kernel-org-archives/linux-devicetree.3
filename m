Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558610;
	b=VxKjMpRZEwY6f7ID491IDxT9OC/ZMqiKIOc3HHJxbp/rrz9h5RKMWZmq4OwNyTUueZFm
	 LsGdtFNaY9odXr1ypp4sjD32NE4ulgd+UXiLmfYQIIQf78HaaQuI/JGSJCslCwp+pFqxN
	 b9d3Z4X/z7procv/CTuzXYl9kTqFoC+bLZhjLjG77XVIgEY9WtIsaD/XlT24AG6/kBfr1
	 NQZhWuOwI8Xz5odlomJvfHSYm4UAxH2i320TvEWV0uXqAAhgY9FdIMLyRFKpkNW8ard79
	 uhgpin39WAU/R+8qgTGDDPUmxxwibIh5z+VIwNRdwVlwmzzZJ3Cr9smv+AX7+Ed/fvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
	b=1QHyThyFvs/QQoL0w08y+t7fFMC1GPqR4FrdqpcrksI6Eu0mLTcT1+o7xsPevQvijg1O
	 h/R+UsxRK7bqBcXeKM7TfKCQWZ7wYk/fAk8qNT/UNgFpu8kgnjsr/b//rRBWMIYZsw9bV
	 z/q6eWOReyYwFTzzK7OkuIZWwk2MTAv6ITLgy2eRzJenhNa8HRc7zInIkNG5aHoSNCKPp
	 jlp98DB65SHpVuM2WlsVwjjKf6E7VjdgIqQ6+7mUnS4bZ3QgvKE4RN4KkYGKpC6YoRZNS
	 jRBYlbKZOn2xjMqrUmenaRUC+l0+3g2Ef20aG9EpqtpOiydUDY/RDp3hUPmxq7wMHLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9hpyqMX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clbBynL1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21901606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21901606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9hpyqMX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clbBynL1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F4ve2391337
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7eU+9UKpstYUUXcA0ZzkT/
	1ibGlLMaGdIyWkm2MNBlQ=; b=h9hpyqMXMIde5aLNxYKXrZM4yuOzilQU3DH2a1
	6EFSwk8BRFLrb6GS8utgZCbKHz/J/qNvL7nreoOl37FSuQRVCaqVpUWsH8SlR5kI
	AR/wuhg7R8CccOpDcZSAPFjQk1i3Xnt/LOEaTiTo3xjAeLDhoT+Xo4XUyrnr361i
	qvJN2mzDFq/Ekgts2AD1TEO0U9Xjo2+bEUNviPmhbnZhETcj2Cpplb2NtLdmVtcu
	u3Ur5UW3e9FquocpbD4AVHtNqkx8LJ48Hj8bjCMIsABV5PhXuIW9CnKkRy4VqWxN
	GArZoUqcYwemiIaVfWGYmubfLEXLIHjWHXP78MfhjI6EYLsw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99tdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:56:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso834082c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792558608; x=1793163408; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
        b=clbBynL1U88ui2CYGCj1ijRhexIWau5T+Gp30UH3eNOuVTtumMZV7hbGecjuTdBEWa
         ds0VFc4CWKjGo7dEm9vheuS1MIfoOWvZ6vEINUTbWWnhoVe2GP/pXny+H5TpDQm0fnqs
         KYLW83Az5e7LBzWqy11zFvueeA2pLvg7tMqhLFecQi+c+7msIKCaoEyxplAFzz58fMIb
         o8yNgPttCUPMwiOF8ggs27BWCK8oGyO2mL4V90VdgS+zY5rDm2JrT66QnC8mo9IVRiXw
         uu/MuQfh7BXANboqDZy+1pKs2RHfhlBunV/BLldYJzPcD+t8E0mzVCIUfaePWfNNhWBD
         9nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558608; x=1793163408;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7eU+9UKpstYUUXcA0ZzkT/1ibGlLMaGdIyWkm2MNBlQ=;
        b=QmxvhM8xUYmHQ7xHDYaCpFFQ0rrnEEnM0K1+IX4ryw4xHhe9fh/+go/97kJvsbuLeA
         SXIyNdPFJCGbpQBIl8HCE3SX/E1GoF26pEfsn2iR7pNfwYOr3TYmeW8dAE4fTe4wXEUi
         nTFCv68N1OwpsOB3U3OcZ6fGSknOBLkeaQYikJi/RnZLd8h4GFwLlkSdynCFqF403bLY
         Sivd6LS4dw+ObSL1W6xtqnEbXCvdKzwrWFJdBqcHo5BfbC/f42+uCBbsa+PIf3uGPmGX
         G5mEB+ebGf1z1w9d7ENIOIEePfxsLn+WtDtJkLpYQ3GsAWRxfMStSeQ7XjnF2KxiUm7W
         LyVw==
X-Forwarded-Encrypted: i=1; AKwUvBwOyY1M7dWksDDEdle3T3VPJc3TdwAERazyCxhW63zUCKfbO8MKCNLy9G9NL/kdCRlv6O4BgFydqKUT@vger.kernel.org
X-Gm-Message-State: AFq9FYKhSEadTzs79O48ogzoyvo9J4ACNJAnh7HsjxPfsAyLAbOe+CZw
	apTl51FAhLo/Oo5U1pK5Aw5jHFGmKgsRz3DAfwRezI+bm/42wTEqvAt3Qemy9Z/Egaf5kvRlKlg
	7sziK/stRHh7uSHI3agD44vYxRA3Q0vEHip9udbzKyEkcWgbe7l/2pM6CjobzYaS2
X-Gm-Gg: AYBFou1/2adTQwc0bSY/9c13o+XqXxGRYHDRbDvXOgfN/SsFjN/Rc4TJxJTXo50NbhX
	VcyBiiF3IM652iHmhBcIbDBpbw9ClJR0RGmLfwjJsBqoRDWD+Cb393F64tsxZj6BUZ7af5ze4qR
	EysCv7h32SwIl24xD17RcgHddk7xxx025caUJ1FGEGQUVZaynm0VJbjBAnYGygoLezhMfo+qR75
	/QhFiSSW2gJKvqdpkOl0OGpA/5JL+6sM9+AbPfEFC5GOR7I5letQpvLmc7EJwTK2IlvKJxKxfef
	4kEjH6dNk3EHfnHEIxVwBbOUPrkT3/IU5AIOxLFi8Imh46VU2ZhjWYKaE6Jz2Ic6XZeEQABsNcY
	zL6G1UsGKkM5qIbeoYyR719Y2GBA1NOE=
X-Received: by 2002:a05:701a:c90a:b0:152:92c6:8b58 with SMTP id a92af1059eb24-190a6adaa1emr1087594c88.35.1792558607733;
        Tue, 20 Oct 2026 21:56:47 -0700 (PDT)
X-Received: by 2002:a05:701a:c90a:b0:152:92c6:8b58 with SMTP id a92af1059eb24-190a6adaa1emr1087567c88.35.1792558607170;
        Tue, 20 Oct 2026 21:56:47 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm3149280c88.8.2026.10.20.21.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:56:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:26:41 +0530
Subject: [PATCH v2] arm64: dts: qcom: kaanapali: Add memory-region for
 audio PD
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
Message-Id: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAhG2GoC/2WMQQ7CIBBFr9LMWhoYrUpX3sN00eJUiBYqo0TTc
 HexWzc/eT8vbwGm6IihrRaIlBy74AvgpgJje38l4S6FASXupUYUNz+LaMUgtRw1GdUcEIo8Rxr
 dew2du8LW8TPEz9pN6vf+JZISSmwbQj0ouTtKfQrM9ePV302YproMdDnnLzIvTo2jAAAA
X-Change-ID: 20260922-knp-rh-b090f9ec1572
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792558602; l=1627;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=g7PmCw+MropldZsXCylYqSjzw6KcxByQJbN1pb6h64A=;
 b=0xXacu5E7uFMoh9mM6MSJbOYT6ty1oNvnKT8vUy+qPJHOcrgcESf6ys+BSbHv6HRsDNGTANUp
 Cdh8hsFnRR/C58/ED3GpJVJ/Z17lFpcJv1iydo/W4YrOyDJkMAX9etA
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxOSBTYWx0ZWRfX2DZpENR7eI5h
 lKAwJvEooiclg9kkjmJ5nweplgZ9xkw53iKqT7gQUxvYyZ4CcMyPgbeVo46izoktqEVDBAyTIO3
 kzTX9EYavw/KEfbZQaD2O3HffAkUY0U=
X-Proofpoint-GUID: gK8pwmOmkTLh0YNsOqANbmvFqMAcRcOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxOSBTYWx0ZWRfX63G+i5C4sLpf
 bGrioHYHN3dZ//wn+VB9HxWxG7xbdKZiwMT8usDBJjtElOivbzqJfdYJjRA/R9VoSfPkhV8j7FR
 gIbQQnQmd4zC2kvLxIzvkDZUwr7McR7YwKdGu0jKTkNgcfMQmczjonAkLKVSfMg8T2v0MD0JAGY
 DXPtJWlM2ZCS/F82mvwUL0prb9tRZ6/aySwuAe21AVNot2yLx/ozf5gEv91JTvXyjxiLgJaDTKa
 e8JjF1LCI/iBbKkq8naFRzWSycFULz9NHZLYIdZH9O4tlu7st6Kd7anEJKy82Nc5OX3MectF6FS
 GbxPOXd+p9SyOki5JNBTvZXx5SXvV/aCLcCsAjBeLxniXBzXtTT9T8EVT2uMWlakfkpn41fJCJn
 bL37y+3WJTO/tSNSM044HIfch3XFKOhyIgTaLaTGO8bomWLCmu1bELCcC43NbFWORMr4C7SKkst
 MyCLoVSeUUwu/X4RlPg==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad84610 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eaQUxe-TdNk2Jkw2ZF8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: gK8pwmOmkTLh0YNsOqANbmvFqMAcRcOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210019

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Make the audio PD remote heap no-map.
- Link to v1: https://lore.kernel.org/r/20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..8a1b53e9f73b 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -451,6 +451,14 @@ rmtfs_mem: rmtfs@d7c00000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2755,6 +2763,9 @@ fastrpc {
 					compatible = "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-knp-rh-b090f9ec1572

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

