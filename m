Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D24E488222
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556726; cv=none; b=WLwn9673VoKCyto6NWynbWgncQwOIBDZKHxnPnbecB0UFgjy7y2XJeRgUN+sRCr8VaUMohZxxK7HRzFT7pnrouhgzcVbFEzCnex4GIvAnBeO/QEE7/DknlMY6EsBEvtqpIkC7DT+qOmpORdkVJZ/ISXjm7ZZRuRdbQpk5ZavIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556726; c=relaxed/simple;
	bh=itzmVFDKn8NTTOrGyTyAW+4CqGuA8ijGDX/I6QdcReI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DJTsTis4mdmGSTysuI+mSap7ALRE7QJH7usHmhleKejpoLu365a1k9CAAY5QlQ4xl9nn/cathC40dAAYFRzsrhBYv4Sun17zye0D2iRYH59A507wpr9XITSEcDaFP0lKXZDQOvtyxAhU1wyjfVJOfg4USEtNm7DN3WGTerhLNzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZZKytLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Htf1cujB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZZKytLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Htf1cujB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92sZc1552955
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=56IGjlGPF3KLMkCxJGQ8bq
	STegBdBTvKkf6Q5DGZFS4=; b=EZZKytLw7p7w2j9kFoqTavCpNanC1/h7npJXM+
	jRb+cqUKydn1qdxDN/4tT+HnQyhT16gP9HEQFxMyrlrIYxIcrb/UJNnLqL4KDKWM
	3Y4qi9EexTs9Gx744R+B7L+gwVL2aN0pMF+5wTrvKhn7NSXzawS9T3Sr6rWQ8qEp
	clvwYqlDBmI6/08esEdPgXdBUc892NIWafcaIcyQvXE8V6eL2Va/QkAoEHeLKe1b
	cwdRs1ozqfSP/zIfmBlnKMwQp931AMi7oJ3nDi3h7XqK1KfZQ43USQu5809+Tm6s
	Q83QZgmlajj01H8qzXAQh6KHoss5YlcasAMONjeixiOdUnag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n648xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:04:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so386396385a.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789556691; x=1790161491; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=56IGjlGPF3KLMkCxJGQ8bqSTegBdBTvKkf6Q5DGZFS4=;
        b=Htf1cujBLhX/i9ssX6bMFPrffC9+EC2wBaBcRiUQVxdqGhnHsGbmDTP6ra0ILDKj6e
         jJs8zqVf5u+jCiMFUwS+bCD6iTTqpwR4G9/Ysy6I8cS1kuQ4yUTTQXSDHLzpniPAm+Ou
         Ozp+7tKXSg/HYzwellKHInwr9bOT6fq3PVxascTiXCVna5c0jTAnmN2x0fycJgsc+o39
         DZfdECA9qlDIu1/1SJloI36TDVajL/Yb1luZa7EJVvL4KMwm14qvF3pfl/5gGIx9PD0+
         Dpy2pvrHRVr7cmLlf/6U5+CeJ+/eXY2RbKlhXK7MIvvkziJmaUikL5llYebyNEyD55ip
         ekKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556691; x=1790161491;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=56IGjlGPF3KLMkCxJGQ8bqSTegBdBTvKkf6Q5DGZFS4=;
        b=H04neQVYxeDR8NA19h5w36hyk9n7h+OVN2dMcat46MjQwfSeGthuN5x7pgwB3B+138
         75wEBGQN8Jb8DEV2uXXYUYtuZufy7FdjDG4p1c6h9TQHJ9jXktXWFInbvIwD7uKUmNKt
         PItFtKKH1qUM8uFceAjMbMGBTyDoeqCEL07Fw/39BCiY8nhcJdzFk6mASje18t4nxKxX
         YF8zkYEaaItlOu1vgJN1YHnTpcyRoSmiE/wRv0+ehPksZRNtMY3Tgh6ioXzZVaxPoBuV
         lTcGbkLQLeobrIfO4SiZpg9Z3Y6gx4CZtFOqdadnryTA/H6nV1tvOVN0DyxuVVfKXKjM
         wxJg==
X-Forwarded-Encrypted: i=1; AKwUvBzpywWFm+jLyQHvrOORjoyQcy7ofuDpjy6gqJraSjUvIMU8QO6TkatdHqG89cYaU9rq3Oyvi34buifp@vger.kernel.org
X-Gm-Message-State: AFuF++k3TqxnyqniKUGJeZadkyHR86L47KUA969aN8SG29p09gD0K2Rz
	knXHlE9r7gkYEY4b3J/f0Ik7ZmAnOQ+M5iWwOj2GepxfaPe5MFWXqh63rDeOWvjYRROI+WcwCvr
	fzhVdzRyutJQBqzncP+WHzTZG6ereGCQPX0RRVIs67fKVBmbZRD8VXEIguL6iOEqD
X-Gm-Gg: AYBFou2jEoLtu/3BbI0rbjrZfMUn/ZOwDI6m8tJdnN1B83kTHZiDEyS6pkhu4dOLM80
	qfvMgIZflNMER+BUzP3ON7ivGqVGrGzFmDv3kAXPTbx4dGvxXMBqMiSAcPM1nbIGTPeyCHZu9gB
	JKinlVpBFJkrZh+KWKZ7K4ghXGHZCa/Dr3O8Ggdh8o6TeRjN1q2Pnz+jYatJbwwmP/qRNz3JoYJ
	lAHUA0TDApyY/7aCtpNm42UFo7ozw5CakDuKQ3N7GuF5PfhEy7ZiwBKypUsc2SJCda9PzhnXNTI
	7PUoHJ9t1r7jC0bXtDXz2g+0f/7cbuBl2XeE4q/4XAYj3cpTGlSnxJhCTHrsQvjXhSPXHfgwEOn
	kNRIbE/I=
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr948168685a.39.1789556691380;
        Wed, 16 Sep 2026 04:04:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr948162685a.39.1789556690728;
        Wed, 16 Sep 2026 04:04:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a8d6e2sm73188445e9.1.2026.09.16.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:04:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:04:44 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza: Add FastRPC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMt3qmoC/42OQQ6CMBBFr0K6dkjbBVZX3sOwKO0gNUChU4hKu
 LsFTdy6meT9vPw/CyMMDomds4UFnB053yeQh4yZRvc3BGcTM8llwY9SgI0Eo/EdYOteGrS1UGu
 KYTBguCqURm1OpmapYAhYu8defi0/TFN1RxO3xq8RcJzSavxpjaPow3N/aRZb+tf6LECAqVAXy
 irkorp4onycdJv8Lk+Hleu6vgEvCAiD8gAAAA==
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4717;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=itzmVFDKn8NTTOrGyTyAW+4CqGuA8ijGDX/I6QdcReI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqnfPg4MFykmpqVGbqJBwB4eaymXfaDTE8VDGr
 x4VYwUBVGaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqp3zwAKCRAbX0TJAJUV
 VqNeD/422ITNN1lwQ8m2FqnsosMAPZs0HnCdq+RzXMlZ0t/3RAWEZrhyuCalWW4vgMXCNm+s047
 33p+6hhNT9HC0IKH0r45mzKue1ZgHdL3iyVFsnDhvzwVMa4oJoaEfEjcT+Bnvjxod4kwjCVnrff
 ILABVpta80mrclFAJgRILHgB4Ua1SWSXAgMwx+ugADMYDP+PZseEL+9N/tV3oLbMqCKM8ZH8u0N
 0b+OVhgjU2WHKJt9N+xsGWEVqXMRS4J7VVBLpr7QTDYM/4uE+FTxk2t1aVZjuxQpaSwgU5d1grE
 wcE+UAJqWV4R+WMF8Q6umo2ClAJgiZeFoP7PdTosFE3if7HjRyX7cg/xCqekUQwJfbLanscUKzF
 MphRFZ4MDP3+UhVDTichAOqzCku0JI6QyIW/e3jdUOwPgl2aBBiaOsMS3Y/63WD7Jy6YWuTFx6l
 xm6kPLbnu1jkxQ0s+7aAqji9XYylhg/x/cB9rY7agVVe4ubMIt8wAt3tjORKnEMk4FhEwe6D777
 wHzE2Td8ZO8HsdqM4f9sSfnIMr9E80fHQCj+tjR0i5c3n/ydlxNH6W+X0CDEEJpClJU5GJkO2iq
 EjpjIEwHq5CBG757xu0a4WjUksD7SBAurXMCzw/rY1js3rUCklcqUJQVNiozt2WKK0FCeQKgGpC
 u+xuGCtfVMLBn/Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa77d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ACN0MSR_Wp2rSAuxn_EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0NiBTYWx0ZWRfX1UWU2Lt19Gql
 bTSbfECSRH6xdvMEcL8XKu0Htv+MUJYnL8otXTxzFPRW1T4Bsqk21BCdf8EXhlb3pqaVnj4qIYD
 K238rkjc3ug4hEiO45DZNQRhRE1131yxMj0r+2ORwPK2ZwCFdPDSGVwe1Y7JyWDO8aU82D9cU2v
 iift6ph117FdqIvmrIhC8huJwkMfo6ezK4uaMEEjcbJ1CS+lKzUe9gy9lSdGKdViouQ2lLJLOXo
 igfypshIrcIS7kPedoGn5g9ARng3WxTW9D/p+j2ZRIiRnuld0+THq/w2vfWLDNgbSamUmEYJRyh
 i7b64Wh55PGlQ08VptBEYoQP2n5g501J818GFW+FMMfQ+1nyJXaCfiTQKMpAqEKPtwEuMqnZx3h
 JEcUEhPW7NxaJphi1y4ko/wtamM+eve7S6LMHX8FVmwUjTGLizI1xg7tIs5/hhfVcbhFt/H+uA1
 242WDznzTRxQwoWqsnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0NiBTYWx0ZWRfX8oYARYBEUMkS
 GjG1dcA0f+rk89TIINjUYcf6IMHSF6soisfZZrYqX50pB1TWGfdjmQRL+SiQ1OxAOvAtNx8dS2y
 rwdduC0HyGz2jk/XNKSt62K0aaYA81c=
X-Proofpoint-GUID: FftB0aasM60bP6W3OlhP0D-awtlv_Od4
X-Proofpoint-ORIG-GUID: FftB0aasM60bP6W3OlhP0D-awtlv_Od4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160146

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1066 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 146 ++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..76221544a193 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2432,6 +2432,64 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4629,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

