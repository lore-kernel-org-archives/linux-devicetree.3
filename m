Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818FF3A6B89
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915089; cv=none; b=losgdOOkNYRDiPLQgczF4oAixiI0xfGb+DQp7Az7JPilxA8BwhnPx7jJAWC7N0+pntRwLmpZXelWnWiJnxGEwxQdbg2t4mmkWxYa+m8r0CQeQ9uhyk+7T7mfgxfs66/2SMKVvNLeN5E7do7ud9UsnbhjeHOJxMnpxWx22RWXsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915089; c=relaxed/simple;
	bh=h/yNVx0gWXcuWfLOkCoNxXjC56YQHgXEI/4my94jYpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIFHojBo2GVng88f71xSNWvs3uGa/mMIHL2FYK5nLIS1xZCbY9sLBArJkhRF+jGhl3Z/85YYeVUWMYyZDl8fu4gj/Hrnl+IZGGtwhLA60SVa3yUWAA2f+NAGYiEA0QDplxZ2OjiPaxqx4ksopWL4MtTp1roSqyRABjKK/KyZ6r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asZO8Eri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GROP3MMy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asZO8Eri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GROP3MMy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoswj2289291
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=; b=asZO8Eri8K2BUbig
	jmKKXhn2W61X3JJnxcyvSlvpYRq0TkUf/smABB4S5fC9xtBPaWsXCxNGwHB7lO2w
	2rPhVzIhFkCkIJuqc0mjvstgU9ZRzRB4mgyiH6JAGHU4D5y6FmkTQ67lYy/C9wY8
	OC1ZiyAug72P7Dk+gWxjGqBksNlbAd5rLWuSr7xcbzZhBYrUSBlCP1m3oFamkPpA
	RmQPdrdqkYClk1c2IDnYPnrDWyPDgsCy3zf2a502vc6VaiifVXeyyqm719foGL91
	Dzm7z/CJGOyYfPavZya8K7JCl8th6FyIJaALZbP7hEGF2XnIiD/YlfrhyWEBbF5l
	15BjNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnuh68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:38:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso467740085a.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789915083; x=1790519883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=;
        b=GROP3MMyMmKlGgy7svpS8XZ8948O0i1YLTzzHtdasmTpsQAvpYuM0OEdYnYRflasrH
         d3fIOhC2qXjRcgQO5ox5CUg7LwBT/CUArhQrZMTMRScKcToV/VEbcpfxPCVAS8K/dfK4
         EfMKDdROHn2euv3h+gJN+YQtce1jlYFKKFdacckiglTHNJxnSL0TR2WW229l/sy0AQhe
         oDW9YyAixdQsMgHny5Td1PzsFxP8BwxNQnu3TKi4tGgTlFModT7Ah9b+3DZtX8y8h0D2
         ZekBHnDmcuHrshoXU7C1WuilXvQLKRcdgQfvClb5+fWIxWyKP6oNJ/1MlpTW7Eaw50iB
         JFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915083; x=1790519883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=;
        b=Hsrl13K1ulrhzF0zgjspUNT2LatcWrEOTciRJJl0MD1+Ylmo1GY7YeCSosjWqxlDH4
         l+eI8XD/f3Qdy+gv03jRPupucMAji7mlyT5g2hu+VREfT3hqpmssP56k1wraxJ2484Ro
         zJ++Z7P20qhuIP58qKC3itA11LJ8FHje++EhcmwunfL76MnxpygVE3do9dBIhGElpGkC
         pQydo9VAvQRwvoKhj+8ghkJwTD5ySUgxufrKycSodqdd6z1zz5gOMYpuOHG60lYo4//k
         CL28Qpc1nyZXulZytFbz+tM2+8z8mQgTVdRC7PbzE7kANwc+HdEhCjy8HShXEJyBubjY
         jerQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpMLhvLHK+QFhQY1V08yiqDZ+WQ+TQLMh4CO5M/iP94gRlAz7k9ipjA8928/Fqj0DjTI2vqlesmL7Z@vger.kernel.org
X-Gm-Message-State: AFuF++nqLun9ht+whVGjXy6DGMLe5xB2NBe5ourFd7wR26FzrTJY7tj2
	MjD5UTEX0QZz9Po0mckh34v3Tg0MKDcBa8CsuDt+OL12Ow1b7XUtoufAMiLrg+Bc6QZrey2OLl3
	gt5IqjI7m0FziQfF7IFnl314vq+uVjtT0ZYI/aNiQOqiLJwOvvWieSu6pyjhT9WHa
X-Gm-Gg: AYBFou2yO/0J9El2jxH5I9c7P/INoGR5n2RT3fxoCHDr7aBV6D7GRE7yu/kWkUTVPNr
	Al9NbSKgS//DCMHqYK4x4mwpd87nWjCfJYiLeJj2BYVN6p5MA4G+kEzxHEchVRMH4PWi4uGD8Lq
	WfTvBtvh11Bqvfwp+zCIQn5xnuLg9N4VTJpexDngNPlgu7emPzZRjsiX2RoKea28zDg2TzM/ChC
	OpNCpYGJfKMIl1T2/x/FZ0Xyb7O4LIYfWb8cQMJiCeqn/VF5Krkn3PdyDS5fvuYuDiG7mdbtR8/
	CNoYSrJfdTGEPqu3DadIbMwt8sVgBe6PS3hlac+5zD50LdCE5uGnpbKh1nAz4JmlppvcbiZSGp4
	wik3gp6P+qX36FXBJYJDqZ3ZDcUFSxTJ5U3FeSZDbsQIQPx8R0FA9JAI2jjW2ZGyhQv/F1FmCgc
	DZHfnC142Puv0t
X-Received: by 2002:a05:620a:2b8c:b0:939:6dfa:48fd with SMTP id af79cd13be357-93bf576bb71mr517737185a.51.1789915082955;
        Sun, 20 Sep 2026 07:38:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:939:6dfa:48fd with SMTP id af79cd13be357-93bf576bb71mr517734885a.51.1789915082548;
        Sun, 20 Sep 2026 07:38:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c1549sm1251055e87.4.2026.09.20.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:38:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:37:56 +0300
Subject: [PATCH 1/2] dt-bindings: usb: qcom,pmic-types: require one of the
 VBUS sources
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h/yNVx0gWXcuWfLOkCoNxXjC56YQHgXEI/4my94jYpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+/FmSa0paJW2SMhMidJAR2I17cy56sYe13SN
 f2tbaEM3r6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/vxQAKCRCLPIo+Aiko
 1S9LB/9AVciQAdfZfetcblevGwrpZkzXRgAjAhVB5bDrbPFjdLrR9SmcLIqsXHn7lWdIcaFpkGp
 k8iLAEN9xVJKy4vHDX3tiUNy1NNPRXAKJalUKfkHvfKXGlj9ssVWzUscQQHP2JhGmPFyhbrWrl0
 YTOit4sDbVdAxTWbU6ayaZsjK/vF7rKHD5FNu+PISqi2r/Sw49caI8kB+DXJysCwM4jn8u+BO2S
 3YUwVPkk42Xe2XQhFjH3ZD60L2+f3LBaBLxddMlEHukV52j9vmCHzsjOTsaatd+4r2qvYaRCpWJ
 uzsUEanfLJaXkf57UvhjRsKW00PcAmrDtrLUcWG/u29ZCwn4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aafefcb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=RUh9Q5Ta6TeXDu1yFH8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX0nyP3WTOdI+L
 xoTaWE+G2UnA+cyeeDB9QrLaPlToV936dycJE1ZsJ5NZ9P3t/qVWvcspS0klJdG6DvCsjTNohug
 I/MfsvROLGBCp2R4ir02cJBUaj/73ec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX3/fyzGjKkl+b
 mjcYiDZxbnFGw5pB6jbQSMArfa/v/x0tFLz2mwAQH5T45jKIvpy1PI+F1PoZ9sCGnA5i6NCB/ov
 PRlGGn2AYtpdlicmNxvwQS8Z0AxLo3SOdTmwMJk8ybyuBt0MjV5g1JsoOB3EdNL9umnQMFIS4NP
 OvPhQPaNoPw7DrTPohRPqfEqzPBTWG3Uyw76uADSL2so5egqFiS62EjCSFVUvpYZAn3csElIiiT
 lvUQy7NEtCmNMiTnCWgY5YZo/jgjCXKNnOLI04b5rPSwzlIs6kxKFVjehwQt/1XtrtOFp+ogtMS
 9b2qbLALmgNU89gqfC/Anrj+ZDgz9Z6smAavScDQ24iZHby90ySNQcXljbN46WKDca2YPXogxfn
 duUCYG0aP0MbuFov32YVxKLi3yGUYVPckeZBdl7Yyy4xcEHjAB7yozDzNgie8atMv1AnMoJMPMX
 gv+sHZdRUlAbFOZNMBA==
X-Proofpoint-ORIG-GUID: XmoSCNo8KvZeDzRYuS6_PSVlAjnzhJGz
X-Proofpoint-GUID: XmoSCNo8KvZeDzRYuS6_PSVlAjnzhJGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200212

The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
device-specific VBUS") deprecated the old, device-specific VBUS supply
property for the sake of using the generic vbus-supply of the connector.
It also removed the old property from the list of required properties,
so now schema stopped requiring any VBUS supply. Add separate claude
demanding that either an old one or a generic property are provided.

Fixes: fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index ba790c4488b7..db487562cec4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -91,6 +91,14 @@ required:
   - interrupts
   - interrupt-names
 
+oneOf:
+  - required:
+      - vdd-vbus-supply
+  - properties:
+      connector:
+        required:
+          - vbus-supply
+
 allOf:
   - if:
       properties:

-- 
2.47.3

