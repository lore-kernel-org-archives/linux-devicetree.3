Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD18F46E01F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796630; cv=none; b=jTfsuNOvHwX/1p6blzxH/QUSIe3BNZklMk6GtX/Xk4rcRKZqnfywR19vYoxAOZReIYvLnJ/rpjYuBpsiQb5h2mZzRsvZo977ZnPx6eGDL+2VpJd23NCcmIismaKgV18x1CK7kycXWROXaK3lP/jKuff1LZbCLn5CnDE1hO//OSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796630; c=relaxed/simple;
	bh=t83sVHr1wKC8+yaysLXcM55WsgLGm+kgVdHDdB97PJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pIP99hFL+mk2GjJfGu7eua/49bEMShvohu2PLbv81pz7oEO7xADaPURBNvWFi1Yv9ZwE5o+POUUw6zD/QC115XnBY+6JTdCNR0u9GkUFBtW24iF+9jI+5B5Ey9o9oQn5gc7Zy4Glmp9gzV/MU80drKfqcGC34kLTExo7Bf9jQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DH5c6w4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrCBldPU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DH5c6w4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrCBldPU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KkiW741820
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWE
	Yc1Zq7AA=; b=DH5c6w4sJGJd+usdrXWoAopgMpDPt48JcrcySH1Mr8CwnGQE/Ao
	tE4m+pYCdifB3XdkK3EYCXmUaYQtm1aQemBj+qnq+5Y1gbzPhr870n+FsFcJjx+c
	tzMq0M1l/qftz9W5bDOGSzXO34Cc16m7hpgGGW2XXXqQpNNDQA6I8UOL4E08dQ4f
	GL/85QPUaFNget3Wg4gMnHEEEIpvbASr0wBo/fvBAmg98/BfKibrslS4xZNRO8CV
	IZvn7x81UQadSFS4WD71ioPsOvmj7S8Boyx0Agn9nPMo4VgqTAVK6haDZKdJqMjM
	dXDc7yqHHswI5+WOeHHsErBxVNGmgZzFRLw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dj1ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so2375560c88.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796626; x=1792401426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWEYc1Zq7AA=;
        b=OrCBldPU7q6kpd9LuwectKsnVji/7Jt8qYSWwShKdTSy4Zfn/BJxJ1pbNcbCwv3uQ7
         1z/0wcEfgEX24VGswyTEOhMyHO+OXTgzXW0TfYE7WZpOnTuS66ydBOhbNcKyv12EzOkt
         p3pncEvg8on1+zvQneYN6bI/UvQdPaIeRsOINWtpAtJQJ3ahfgIRm+xOqfJKtSLAbCOu
         Nm+mHrh3BWOZqrl7JpQlqcARi6H3vhqKEBqfukU/GicnVqZ0XgtcP2dVT+vZkGz4cfEL
         XAu0gewvt1mXooilO61Tf98GaYFjsGbq7phWPvhpSZDGOM/tNTn2kZy6i3PAKmsBDuQw
         bavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796626; x=1792401426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWEYc1Zq7AA=;
        b=enkTBD/2s4D2VahZdZbf7vj5VySSfHd2TWz6rFYlMZC6XlkDiFG98vDz0jEyfjZar3
         V//aV+jcn8jBJCmVG5CaPbTIGK22K1Ezodab3NzXwjRlYkaiUtzH76sT0LA7LLgQJOqo
         ssG8NTV0sdby8kwq8QtZu1vk9mv+NyrLnn8dQhjkowP9KPAcpg4/q8sKmiFnZypLmoad
         lzbKjsP4C/DgR+ERWHX4hod2THfwGJFCao0Dw87oFl4o+yUu0G3dCAguy7p2w/oYtdTg
         o4QLeqLDkMr0dUQkSrbYrBTsOLhIaAAoGFgCX01DyW3T/EXIHm6plgbXZybxCu8KCaPj
         nAYw==
X-Forwarded-Encrypted: i=1; AKwUvBy3YjIXSgvhAGVv7nNK4dKXfcWn1cBc8D/4ovtjJpQK3EcJZ6bvPN7oZCwPWGanHOeQ5Uj37KOv34uZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1wupJRAEzfrWttzMwrC0qUaplXebA6yjr3c+Wp6Bs4mbh6kfg
	NQDP8mgur+ug+QGogJ/8ZEtX6+cb9H22m0OyNeYQaW4HnypAsKzJq0fjlReU65CC8drjRtUOhcG
	Waw+vqhIzVTSaodd8qGHG/v95v8ivroxgm9+oa1I/74P+XCCpEGRgsdMbL2sTevGG
X-Gm-Gg: AYBFou0QDqabtM9K2PWFbstQ8kPEWZyj7GOGeo9w3wCxHjEsOv6kVnx9OSQzh4LyJMh
	oyUxMPKrIGzkkjWCMSJN5S+McVvyKGeGla+vEFN9LNap/1J/20d9lglnxo7muan/vnpnp+5pEQT
	EfGtUhRQvzxOkVbl2VrXf1UlTpw0XjdC2mV5qPU6eIvNuM0iCRXZLh1hCyiwTSi8qwlbtzuP/rL
	qWBzAvD2o0hBhaBZxlO3p0nXE5GBhvH/Gw9cRGTfHosOeqKm0ISU+iYIM2KKM6CEl/dx6GewOdt
	o2Jzbct1N0Q5ZjqFkFl0RcI/qS3SO29Cm395mxIh13UpWuvtIo4MCNGQsRQ4AxGfGYEj+dJK4II
	qj6nu65pj0OSGOB7jAa+YaUxBZd0H
X-Received: by 2002:a05:7022:296:20b0:159:aa67:2893 with SMTP id a92af1059eb24-16a5d642d08mr11145408c88.30.1791796626334;
        Mon, 12 Oct 2026 02:17:06 -0700 (PDT)
X-Received: by 2002:a05:7022:296:20b0:159:aa67:2893 with SMTP id a92af1059eb24-16a5d642d08mr11145386c88.30.1791796625710;
        Mon, 12 Oct 2026 02:17:05 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm34502575c88.16.2026.10.12.02.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:17:04 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] usb: typec: ucsi_ccg: Add CYPD6129/CYPD6229 support
Date: Mon, 12 Oct 2026 14:46:56 +0530
Message-ID: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX4w1DxV7qohdL
 h/XxqK3Dx9hhYguw8fF3g/kP2nPCEVYzswLxC95mK02EmicZnZg94oC/NFxPbaDaypuOand3L2X
 KKT7WaOYe8MbLpJHA6yDRdwCRKeR0Lm2TOXx6hfkCTByVz0Zh3F5AgDh22ckp47BtaskZwX7rkd
 2PRVrug8gGO1k1kJRmU8ls4dY/FRM9BwNIkMLpo/Ny/DtTqAB0KmIHnfWn0SXvI+VucV/X+Bb/F
 3Sj9p0MyilHykIlijL/cHI4l+lZPuXMOFvR1IanOnzKNTojjfUoIaHgrHns7zLzKK1iSu9CBo3N
 gzyyNh1Ty0W50lQXL8xgJad3B2bMaAR4IVPd8YdGXhPEsF1E4tbzw8YQgcqFUEqTD8vpWWLhJIW
 aj29Uw1y543GMqyk3Dqs6HpAXsNSu1JK05tB27dwv0JLhCP/m2bkWEbu5EyQbEkL9FEoBy+bGLS
 i1iac5oBYris3KXwxUQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acca593 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PrD5CQMRHxEyf_1mFesA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 3p9UIlGhpMyr0U137HZxtOGbT_jaKm1W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX05grJSr9xxST
 VQb750bAbwrK4F644Urnokjo4BOzrA36qxB+1Avk23pBCQhz2twE2qvDBN6M4ixA57fVT0pJwF6
 jZUbyG5cH+nMH9Aa6JRLmA1Qnu2ktrg=
X-Proofpoint-ORIG-GUID: 3p9UIlGhpMyr0U137HZxtOGbT_jaKm1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036

This series adds Device Tree and driver support for the Cypress CYPD6129
and CYPD6229 dual Type-C PD controllers.

The controllers use the existing I2C-based UCSI CCG interface. The series
updates the binding to describe the new compatibles and controller-specific
properties, and extends the UCSI CCG OF match table accordingly.

Patch 1 updates the Device Tree binding to:
- Add CYPD6129 and CYPD6229 compatible strings.
- Support the CYPD6229 fallback-compatible relationship with CYPD6129.
- Allow controller-specific I2C addresses and interrupt configurations.
- Add pinctrl and wakeup-source properties.
- Preserve the existing CYPD4226-specific constraints.

Patch 2 adds CYPD6129 and CYPD6229 to the UCSI CCG OF device ID table.

Changes in v3:
- Fold the new controller descriptions into the existing
  cypress,cypd4226.yaml binding.
- Drop the standalone cypress,cypd6129.yaml binding file.
- Drop the Shikra DTS changes from this series.
- Add conditional binding constraints for CYPD4226 and CYPD6129/CYPD6229.
- Address review comments from the v1 submission.

Link to v2: Link: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/


Akash Kumar (2):
  dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support
  usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF device IDs

 .../bindings/usb/cypress,cypd4226.yaml        | 90 +++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi_ccg.c             |  2 +
 2 files changed, 85 insertions(+), 7 deletions(-)

-- 
2.43.0

