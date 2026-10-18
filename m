Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F333D331D
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307843; cv=none; b=q/XWqqOzUIa7jNGplQL10VasQU9nENOfCtK5qeNIyOLfIVySlZEjEZxkiSucsPEg0CrnjlI3Cig0C2EwYUAHXrsAI5Ahe49EANwGnY38xX6uPsxGTBVWHYWuPh79Fdpd9G8hAtgKvHrlPHrnvjv9SzX2jxlh659CwWAyZf/q+lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307843; c=relaxed/simple;
	bh=sX4fEQfFrNSZ8fgQgLtRKDIGj47yFxCj1lU8vWYxAr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnLEIvdO6zFZXuFzCDzS97L+sb993trqnHyRETH+xsBOsATDjZz7p8WhtppNELP5qZo13Yu9phjjj27jXi+Tc1FFi6uNf72n5Yy5CZbIZQd10f1oMKBLWeB4wsPUjeJRqsC5yFNqtqSk/26ubuYeHybsF2cjQcYwkLnbMpcVTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJ9yJ3bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+Me4GY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJ9yJ3bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+Me4GY1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5t19O2284647
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=; b=NJ9yJ3bgcqAq6NsK
	BZ5aguWeQ5S8ZsBhM9RH6omS92TvM8wYWFSC5ZODZYvQsWltsVfkffV7yyzvL8+t
	MtiiOgYU5RrlwXV2rEP6q2T98yuVQMCFSmKzignKjNmjeAOZgJ/IKJXyBHU/w1hL
	Xsgln3Yt6n9ut3IFR07f30xsU/HLDWOAt7GTdCYbuKmxybTepDonimUxBj7dpl1I
	S9VktXLwJbrJnwMvdh8RzNhSufukDBiFEa/zQwhKArEB8KMTycZwYiwCIkPnnZ4f
	DNjqN+/VoTFqor/v3MXCJZIYogAjFNCwd/Q/CSNYOT7/wOfPABh373ky7RYt1ZIx
	C+qEjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9jf54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:17:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2018149eec.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307841; x=1792912641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=O+Me4GY1HXGPamcrwFTJpMRPNJIByF/sbSAntQw8nHdN0RIHIaqphHgf9szRc8oyxi
         vuVzW0WGww+HX+gy/dwyn5CI576gCtS+c1SEUm7ugIjkPjxlrKu8nnAqfy/vQ+KCFfLJ
         4qyt11TvdEnuyPjXz1zXKopKywgDVn6TZver6+7dECAnvQPZ9UCZR7osdMejezOGRJ5I
         wfOpVzbmZIFWonhd45oIYNg+/EXeLSDbrp7mzGW7ODLK72V2TpAUg63qAeGP064EMJjr
         6d9McdjFzn3UTJY88dVxUh8vGWOr3ATJROGzoA8/oAowuShuydNRSzjl93/rL0gRYIcT
         r82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307841; x=1792912641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=fkgLv97CTIwqddFl608BBvvmLidyla4FD1V3ViEzZ9CABfG+pOwvul8+Zu+bBhGqAj
         +rJ51eJkdDAHVu4meSfvHY754juwwkKiBMebMSdJ2+nvY+4f6U10ZkiHkDyUVI0AIjPg
         w8dcXxY6feMvVFyUmdSqpsIVT0iozoZg19eETvdpTDCnl88tyTPxNme6hF7AYiYFPRLq
         p8lBFqAnFjOH2z8W5F5aqjK1kIk3XDTyG01rK6J5qidbC90GYRENRQrF5n7ut6743WMQ
         Ds6CcKXu4rjjB0D1HeOCiY/CWXt/X2nD26L6PuWS9vGUklVC/RCKNFZDjSfQOiq40vZY
         2sKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZsufKPb+l+O1RKA2VHr3wzJ/gQcoqamA12sEGIfEATPsQVQWeEpg/F2M1d9xF7lVFwrgwLVCCEWqe@vger.kernel.org
X-Gm-Message-State: AFq9FYJknyz/s/Bk/UQ7MuVHUNo2EcQW8XhycdsoCSXO81Vr1irl0MEx
	XquznK8K4RjUvuTLVUTSTw57/rdYw8BTwlLI3trWQHz1QZyeBNOiOp/K7IwUH+TzDjkzmw6x3bN
	XGTgexHeNFhNXr8IKYrlQQpC4hO7eFxrcl6lfFVh6AIGhVQZ9tZtnfjy2A1XTUaqp
X-Gm-Gg: AYBFou3ATd96SA7fCl0u5LLFjUdcs3EY5P3gdI4AzYQwaqDGcrMpvkfX8MXThReFROk
	vbxAqYIcN1SRNanVbxsu5gP7z5vYtbpQb9SJ/GIV+/CJ04F8HZ/3hOVD9kSliKoWU36jBtNc86K
	lTpyWURqoDvRzDAmsG7hvNg7ZbZ4X416ihY5cOds54kRvAhC0bOqJzSr5nMo0NHuSuNFTzTyaU6
	7PIhaca+4RVGWHSBzmKqz3XcSkp7+2TrMOssOeZpUMxCJhaJ6V5GRvyuH8T5dRyRY2TH2jKE55l
	7CimEXUYNDC2eMKkfY/rGHYyOb43//p3FaYZr+bb6vGVIPM5KKJhixhj9l6p0rFDM/jwf6mRSJF
	QJ4HqG3lcjysp6Mqpw+MoDBfSD47DY7kIEyE=
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr6606427c88.0.1792307840345;
        Sun, 18 Oct 2026 00:17:20 -0700 (PDT)
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr6606397c88.0.1792307839660;
        Sun, 18 Oct 2026 00:17:19 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:19 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 12:46:48 +0530
Subject: [PATCH RFC v2 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-nord-soccp-dt-v2-3-4d713d316e9d@oss.qualcomm.com>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
In-Reply-To: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX8zc697Bx1gXg
 ONz/Ni12xAC1n5qTaPyzXD1tFkUUBx1WlPbXnsLVM5TXcCQa/bZVw8o1zvvRfREpkU9mdt7mAZb
 rdU/MbFoVCPsy02/z2CbkmxX+hjWows=
X-Proofpoint-GUID: MCjapVqhtq8WgoORq_I7U2oC1OdIRqHw
X-Proofpoint-ORIG-GUID: MCjapVqhtq8WgoORq_I7U2oC1OdIRqHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfXzy3yZ6+ngqZv
 2BvXyc2A0PzQ2rnnNlNTIUPGgKxZvtnfbsGFVurU53WoB5dwjkOFuBn9SrudUSc0rC5aqkhXUR/
 qs3LAcYE1mu5GhdJrF5nNqkcP9DxfsV7zpml6fC+W44KySEfagRr+j+aqhVcGg91sQN+WiSlVlg
 5cWVFGeZZA5unRFsAL03F1+GHtth89vcGTyvSk7IbDsiRPJG3XSwgnT0luVRb2oIfeSwJdjMAYX
 Yn2xhQFgHdjnhYe5hsolfwYAznNA+lQZhVCQ477FLUXQt+W/Ld2M0o2wY04tKXzVo8BqktEJyC8
 iYx49AzPJficMR9rG5ceCZuvSdHlLohiFOOuO6lhWLEHZrBj5fjHfTCPPwGa44FCgTntvfWbosS
 pksRSqVafFzUiK5DJztfHhiruBfjf9DC+Cptyl7xPFoCq8P190SLAykbfDyC3/ipaQdGiw9RmCQ
 qykEB+ayfCLEZkcx0vQ==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad47281 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180028

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

