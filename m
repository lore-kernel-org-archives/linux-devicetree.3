Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF83EAC87
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846652; cv=none; b=SKRf6Ke2R9Fl/Z2EgAGXm9ck2rcy134SW6nemTCFNeT7b1adgBJUt2hJo+skQ+xCtJqRevZshT52PZAv/FStmSRr8/riPVwEAXgFJA3mduRo7vdkZc5gb0YIcXAvxvx07dVq2Fawq8FMsA+MQTT2N+tZsPYfFeOKr6jwjbSa2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846652; c=relaxed/simple;
	bh=/t2eeIB+o5Fl/LeZZS3s9XFIxqcFUVwSWz7iP5Ex8Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggbPOqA5wazbi/Y4d0qAOOHSlSYMcLB8MmtM4QWPKxfmbiTyFuJTLEnUgLHbkPeU9gwfRExiimpg5FRRKcE5jRu1Su0veqsBa4O6+AYSv0tqkSt22R6MNLzzYiB41o7TGrbJk7yWdbFnVCkSLKEdrdbSgPbL2ZCcXpBcpljL6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJiFhiSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKFCtJdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJiFhiSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKFCtJdm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHJK8v708994
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5s9D9e8hYix
	OqU5sy7Crs/tgyj4HDh+iuwyCYyYRRyo=; b=nJiFhiSOJ1zS70ykGZgMZidY0TM
	cezJ3asFT+o2D7eU6ZGiATYdCTsxZif1p21Q9zxO+h5NCKWBcGKpljAcF3p7svH5
	kGQBsGr+3s7BWZ4rKa2UrrtDg8jNJQHPrrBIj1gYE8oMKZLPEz4vWAKS6QP03pyi
	aYY0XE9wUrp6hHRnf3ndvEwUoic78uO1MRe4nh4jqD3fuyicJZ4VdSbX57Uo3mjz
	nYjlrQRJnid6LVeov5uLr7vZjX+LW/vrtcPasF4fZ5RQ8Nwr3o+ffH1qZCixNQCw
	n67KRKzhM75zT9Fuq/f3sM0B02lHwZQv8Miolwd1Smbc56x9+xKoIbY1hdw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82d40278103so1693673b3a.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846650; x=1776451450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s9D9e8hYixOqU5sy7Crs/tgyj4HDh+iuwyCYyYRRyo=;
        b=IKFCtJdm1kEx9qf/M5H/uyCuhhcK/dH5dprvsAzR5ceGDnSaBjXcZs28uyr1z7lY5y
         xv355vgveOQ+y+3P0D841CuNq+oo/+m7ZJAxL6JShi9laQG5r1m07nFH5e+h65u8lDXA
         Ty9x4bdtxt06CkVGxCJC6GVo9eZpArZhL0z2iRvTKtrtBkv0qumTY+Yc3J25RcpfvxBo
         AuXp09RApchtmhy2C+0BC5E/lobkeLnOPodpqkGAK4STIUtDaqZqpjweGyainmXuFEmd
         WQGMXnfNReJg29dSvB8XEyXmQ+hVtP3Icgn6cizJcevnwmfGC3XsO7BILrw8V5+aZbmE
         DGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846650; x=1776451450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5s9D9e8hYixOqU5sy7Crs/tgyj4HDh+iuwyCYyYRRyo=;
        b=Rin3wNQW4rDPtvmpLFmh8MUYnzsEvFEJweOsgPlvA6xLAODTGXPeSq1KnboANle7Fr
         ZNBTbwRkC6UoyrG9q9nxkLHHTogJEvyTFSzTSjr053NbCWm3DdZDt+ppvY0RAJbWAhhr
         9ghWUed0RpcSFK/FdfOGH6cMffJ2qraDnZI805MXAilHy5G/9CgEZes+e/PoqEgCxNTG
         pXml0bmWbyA/sf5lsPp4UNXK6BwGzJSZcdGICAnz1re+XuL/Ye9GwWM+hBIFisGLnWaf
         aHaFgkVzFmmHonlIzU5KYlkAx2LByYSA1c0HcyN9kUJ+rFX6wTtpv6E2QqTm9UKRgTwE
         tWTw==
X-Forwarded-Encrypted: i=1; AJvYcCX/7C7M0zEKPcmdmLnY7vBeeYd8rTbdDvRscpyAEUlJgWC8K4/VOG3tSv7SlFgfW/i2QSz3H92iktuX@vger.kernel.org
X-Gm-Message-State: AOJu0YwvmfFDoWmEh5TusugRo23vGPo7JY9ve1p0j9u9X3nqp/BJmN8J
	3lnbm7tVJtB1NyG466ZHOC5YKuUJEmsZGX0uVVpidNnn577/gw1SHD/wdba1LgE+ZUTIJ1fvR81
	6zOGuA/sLV+IF0G8kOz4gt8bSTsfMsP5XdzGbONQiHKVksN3ab4TdQlncMKrAnKaB
X-Gm-Gg: AeBDieuLtullVbiv+ajI8mrivMCa6WCRheGS1QO8kIlXrLWy4p5L/kzGVGWMd8+sY+r
	4GFz8eqv0iZjruw2yri5fjH+fFdK5FWr6CPKYaTN8xj4sslD2YlKrc2RjOPMpTYI50jCUYknUWS
	2DfzxVS6AFUUvrWbYicg1KF3FoPgza40eODopWThhMYXgAEK7W0dfJXhfu9KiVfbkSHqeFYxJYJ
	FqvsE85Dh3tjUGcm+X3EZpKqjh9hAcqBurU+95yPtma8vcsp5gvOtcTP9Ip/2pyt41zETrV8pf1
	ZNI1DIcNMVNte9s5RGI1Om9vJpADHh7zIygDE48CYwqdWfizjDbLAKvBIZzs+ju9RDFIN63IKtk
	++MMHGCWZkWibiyjwkOPSsZBIhOylTsB7rbvgd4Yly3COCrtW
X-Received: by 2002:a05:6a00:1796:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82f0c3d78efmr4854096b3a.47.1775846649750;
        Fri, 10 Apr 2026 11:44:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1796:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82f0c3d78efmr4854069b3a.47.1775846649137;
        Fri, 10 Apr 2026 11:44:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 32/35] arm64: dts: qcom: monaco: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:09 +0530
Message-ID: <20260410184124.1068210-33-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y9S7fP9perzvt28eVLTCD55APvcsWGk9
X-Proofpoint-GUID: y9S7fP9perzvt28eVLTCD55APvcsWGk9
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944fa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=uPPXLhoC2QroOpj7Ab8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX2OhaCw/ndyIY
 yCSxqQYdslEOlY2kDs98AbAKRBxuTCo56m1k3pgOBdaa3g75rl2NkDhSV8lVPBJnClrZ52iKo4C
 W7Z9V2kkQeqKvPHHup9z4FJTtn1OnoILc3/aF5Zt2fcNgLbKjg2yfdriSbwG6RLqZIsB03o7Alr
 85pq9OcwNuW0Ecx+9y1FIek80KyauDDbxbSqkidTVlB4L3ZAP0hJsQe2+L7aWdhy7U81CmRTj97
 2JkctGh9+j3Vd+c7ngsVMDBOVZnk65/XwTjtSaTKXpbjUMxOnfAlTBVROg/6H0fK4Q7gYI+VDeF
 Hmhr8pj12+5r9qjw7VXdQUOzKYGzP4EDj65WuFHnqnNOdDXTTJjlmlf1jsVVnKV5AAKNwlQPH+E
 XtCz0cuYkBJiM0DYQT2y/3itKNBNd//9MyO5bQyJ3Xdkaq8C0o8Z3n+PJD1C4zKp2m9jbEdOAM+
 B9pbMb9ws84MyW+DGrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 84b22866d2f3..cf71b559b094 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5744,8 +5744,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x10000>,
-			      <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0xb220000 0x0 0x10000>;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-- 
2.53.0

