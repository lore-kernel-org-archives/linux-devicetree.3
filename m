Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFD2406289
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366195; cv=none; b=NsxwN9gg7tgNOpv+rnPzBouO9vdPJ6pEt0Mt8ZZe7+8jkBwoLyZ7iX0Xs43Hp59/6TOnY/5A+u3K2bi0nM6bW8WZM95ePZjmrYX2eH1uoJ26GFKqE2Vdq1/kZ7W+8pAzRRJZCErehLBh3Ca90Gnfx17v9xRdVcZDU0e/guEtg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366195; c=relaxed/simple;
	bh=ayCtv/76NZqDB52ku81hrizLByZHgGq0pT3RXnO8+tM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cyu99atJX8mIDyzgQBb0P+7pthnT8R5etjBfkkk/K5mgGpbIRUL8kgFj7XDmBpVA4Uudhk7gQ+L9mXxLAqsysRlBYmVXjsQoFCXY63Dc4ty0Hky9kjJ/T5o8pVBXRTHgYCyQcP6NbCEv/FFFSFkV49IWfVOoBTS4m+neYyD1LB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxWdi5Y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkUY1Qta; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxWdi5Y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkUY1Qta"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC2j22409057
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ilx05Tza3jC7xkPhEovclZ
	BH8zY9o+t/Ly+GoNVsd9I=; b=MxWdi5Y5l/K4kkSz6OqWBT27nsjb0+lHnAtALE
	aB6fTpCJsTTcmSDnXpr29wgT53YAQwn7aO9IAe7azVskRQ6+uk+0B2WrPPkGLkkS
	rEPvMvJ/VZA+ES9mBT9bGnesSfi4wpIcY25QQZgwNswjqXX8OJh59Ki8jHkIVL8v
	x/a44dFw3h3iEPx5T0d6/e4R67YhKYeCj69SuewhjBv1LtDYse+CZupDf9D74tfv
	SzUQDIIgKPA8WgKZao4CG5peLgNTA3BnonlPRdsceYJ1tb0Zbvvp52POzCTgDwJM
	37x7gH3tl/0VzBOGFBUkgRSA9+lchVgko/lzzRrALPgV1v0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3next2gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so381872261cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774366190; x=1774970990; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilx05Tza3jC7xkPhEovclZBH8zY9o+t/Ly+GoNVsd9I=;
        b=WkUY1Qtash8kSClzebxLCd9cuzRlvgGZWVtCYSF/DgvSlzPL4ZsF2u0mo7unpESHG5
         +XHFqkZ5GkN1rRFzo7hXYd45GJuEfOCgBggCMuKt1WYUcBISCgws3rPD7sg68sbxackg
         sysktGdvaq0f2m/5gcM7hCxRfYva31dT97fu3n+DYGESbx+Kmhi9/EomS2pC0Tlq96vj
         hs53W+2o6f1eK/9O+d4g3G7ZNE5a3H9rOmAjk2O5e+UzPIznVjE2JSGf2e3OnYj3Xs8F
         rRHd/hoe+3QvizFgVcr3tYLoc5EaTlUXENAbQACG7d8lCK1DDvI47OoRdCT07A595q+g
         WW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366190; x=1774970990;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilx05Tza3jC7xkPhEovclZBH8zY9o+t/Ly+GoNVsd9I=;
        b=DWzjB4OA67eBjwunQvxR1O/WPdJFFgbKK+g8DApqb3oye0nqlNmSJh5gMglQtJdp7R
         ZHgDMZ5oTO19QXaqESyB9kZk2Lhfs8aeub0QvhoI6IWBIEvik+g3X35P4rnhLcO1Cyy6
         JCdohHnj/ghqksq6n26If+qk4ENbDcoIgiciYXqaG54m09wwcUb/r1FGS2ZgesgQLVUD
         saJ4z3BA7z4fqhJGXoUxCNnvImaOgd33rMA1q06jCqzCldN4KvkDzCgulTyhbtcZJ+RP
         Ye5xi3Uy5AjSggnRzAW+7RixBJoaoZ0QzdK5WM4cdjFHY/FB31iJibwaqnnrj4B8aydM
         fAdw==
X-Forwarded-Encrypted: i=1; AJvYcCWnTttCvUlrrqM+p1MLMl03DUxYdu+EmIKfiG7Jqfw/v89JDP+DuVxBbUm0Wsli70JGIR1mr7fcGP5P@vger.kernel.org
X-Gm-Message-State: AOJu0YyLF77Yz7rQZ4hK8/TUn6sFHX6h7tCKWBzGxJJhy2ChCPQ4wBwn
	XmGW9/epNnNIJuEISZ4wN9Gf3FFtvEeYGyreTK8wsnINz/0MQ15aix6GMaJ4XuZj2Xa6MfP9YVI
	n6Sz+uDGBnIBNApYYVRlrHP3n3idaPYtQ2Eey6FMdAniy6aVkezaqc7c0BjWlrqrRR6c802fI
X-Gm-Gg: ATEYQzwmwb3Hka6EQy2tPyu9GIt5RBFJXUen4h/H2ChGtoF2v/BopxNsnCAqOxoxTB+
	7H6ztv+dzsTIKXGNkMSgIefyo7DjKZPhRurnczQ1om3XQhUo9MIBby7gxmQWTZyaboNQ1G9fB8f
	opXXdxuzsUWrZdPFGZY88ubjX6G4LKUaeLkVsFbSquz3iX8ROCfZShE0xJIH8QkQXYQEr7pale3
	V/fzhzMmTcMPFQNOL4Jerq8PTdNY9JSnp4PPPFoCFYXPDvlMZMwsJEiS4tx+oPiHgFc0k8Ds7QG
	4W1BJen261WKqZT6m/QT3teGcF6fU/ZoD9ld6UbsVxCtoH9/hrFmpbnG4CONkMpw1t/md9h0l7p
	ws2ZisiS5HpC5Uk35aXPzZgDdowk=
X-Received: by 2002:ac8:5816:0:b0:50b:2d6e:5253 with SMTP id d75a77b69052e-50b6ef165admr44487401cf.41.1774366190088;
        Tue, 24 Mar 2026 08:29:50 -0700 (PDT)
X-Received: by 2002:ac8:5816:0:b0:50b:2d6e:5253 with SMTP id d75a77b69052e-50b6ef165admr44486611cf.41.1774366189374;
        Tue, 24 Mar 2026 08:29:49 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6e9ce8sm36943385e9.2.2026.03.24.08.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:29:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: eliza: Left-over review fixes
Date: Tue, 24 Mar 2026 17:29:40 +0200
Message-Id: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOStwmkC/32NQQ6CMBBFr0K6tqROsQRX3sO4KGWQGqDKQKMS7
 m6LGxfEzSQv8//7MyMcLBI7JjMb0Fuyrg8gdwkzje6vyG0VmIEAJSQAx9a+NS81Ia9GXtsnEld
 lIasKlFFFzkLzPuD6CMXz5cs0lTc0Y1TFRGNpdMNrnfX7mPu/4PdccKOk1EqoTEN2ckTpY9Ktc
 V2XhsPikIdfldxWQVAdCl0LBXmZG9hQLcvyAUKTL24aAQAA
X-Change-ID: 20260322-eliza-base-dt-fixes-6b93dd26c697
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ayCtv/76NZqDB52ku81hrizLByZHgGq0pT3RXnO8+tM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwq3mUIds6MaN4hkbfdyUSblwMSTI8XL6XmVQQ
 Sit1JyHI2OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacKt5gAKCRAbX0TJAJUV
 Vs2eD/9tXDc/pa8y6t90O/XHR0Lrpkwx42AKCFdWNR8VidQmRb/Dee+++cyHMTvNcGivtwutEXQ
 b6KH/Y0x/QJHEWQpL4ZBf9O9/0ZPegN8ZIpgNUAgni+HEFKFIh/NJh/cBrlTr+HJcmz24SIcJ0k
 AhEdWhJQvMA+6ZcypPHeHI085FBQIRMhL/av1l9G9K5ePC/ZUHH/nwaAMQDf/Q3eAKbNicL/H4f
 zFq6CKOVfNi0UXCY+cRMZ1ZZzsTYG8ifMvqtgSSWpNEAuHDxEeAWXcdvN8l7rDBrhs/KZi2VYkl
 THt5aC1mBxdQLM/8vz4DV2sbW09njxQJ8MojR6weHOKP8HbhSmtY1q9CU/YNQ1WSXq5co0S/HPa
 ZOIaKgxuFyt+W6TGMM5Qi0NiFf6zcfl61nzuWdqSSXuuUKpbKu8V6JkMr6kOw5QIKQtLy60gO0z
 aXd0/zIgI8fO967kMrpjN6RnRs8ICXKDnbVhGMLiSelm7as1t3B3vP3Q7LxPqsB5hN89Ijpdzct
 7hebJ8JCzhMtPuC4oEMXRDpILd4HDTUoD+t27GOi2/UvrmvXZKHy9S630sqfWBBEoO8Fcc4Wux8
 ooRUJPGJeWJ+V80yuF3dK1Clmkdc9nlyFlSKcRnsiBTsb8Qr80B4novu7qeI3ltPo8MMPFrwg2o
 tr8WMIfnKIr000g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMCBTYWx0ZWRfX7U6ZVp4b8vRP
 KY0PAW3tQgVOJMjuKsr1oVmJGSuIQuAtr4J+KXc1L2nguFrtVpvhbyKbQGOltXPf40+lQyg0cJN
 7g4NcD7lq9q4E8jjc6tApvCic/9yaAr5DIdgA2+K4eQsnMHwESzbFdIE6SkriEP7+NtxEd9cJP5
 h/8El6KROTTeyFLr+zaSimDxJ/Pfke5U1JFwdtJ9I4DhghsLDSCnoKjGWzrscS+IZf4wR3XKNj8
 Jde5T9xyUYpUrh/LlKyAEI2PTD4OhaFmMOleskZnIjMxoZ+u3vSuwjnY7ESWjTfSa++/R9G0VLr
 /Dze8MJYzvditlpk4rE5U7QnoEc3KV0JETVpTxRtomd0DCkI6LsoT4J6z4mI0GF+RyO5tIeB1Yj
 rxLmLHyG2+/59wJJCGBeQEqugg6q2hGALrMMiCeVF1N56gwp0Nb3Y8Aexrtq4AtiRy2vJuOCmOi
 cnUt/OU1Gd4/x61GoUg==
X-Proofpoint-GUID: 5vpCb_EJPIP314hl0j2f1fwDxy98kD9u
X-Proofpoint-ORIG-GUID: 5vpCb_EJPIP314hl0j2f1fwDxy98kD9u
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c2adef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ypr2nlDnXD5ZSNQZmIgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240120

Some review comments were not addressed before the initial Eliza
devicetree support was merged. This series addresses the remaining
issues.

The changes are split into three patches:
- one patch with coding style cleanups
- one functional fix for GCC/CX power domain handling
- one functional fix that adds the msi-parent to the UFS node

The MCQ mode was enabled during review in anticipation of driver
support, which did not materialize in time.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Re-worded commit message for second patch according to Bjorn's
  suggestion sent for v1.
- Picked up Konrad's and Dmitry's R-b tag for the third patch.
- Link to v2: https://patch.msgid.link/20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260323.
- Replaced the third patch with one that adds the missing msi-parent
  property. It turned out that the MCQ issue was related to some GCC
  bit missing, but this msi-parent property is still needed by the MCQ
  mode.
- Picked up Dmitry's and Konrad's R-b tags for the first two patches.
- Link to v1: https://patch.msgid.link/20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Coding style clean-ups
      arm64: dts: qcom: eliza: Add missing CX power domain to GCC
      arm64: dts: qcom: eliza: Add missing msi-parent for UFS

 arch/arm64/boot/dts/qcom/eliza.dtsi | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)
---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260322-eliza-base-dt-fixes-6b93dd26c697

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

