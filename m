Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7C224E4A1
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786916251; cv=none; b=LL+CepZjDv8RqXqEIx0DqYuSa2JQV5PcjcgbBQT58qgH/I1RlfOUvefR7EzUZTUTIE7bRLFnHWrKGyIupZENshrY0MJynV9ldtCJQ/idnqu+cJhb/w44FdeiDadU6949Y682Slx6mz3bdqQ9oYUP9hswownSHKwfxnA4jYrFPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786916251; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=c5QGszu6z+59zho3mwgw8i/O3oQYSSNViltn3il+jZBHfjE6Ndt+x7xPQVV5p/9MCAMn6dzVe9QQyBmAXb4iooxg35WC6nYXuYBTDEIC9lu/pziu6zNsBTki0h8zEYP2SROYYkcddF28jSNa4nibmEMlOseyrQuG1mh3BaUmDAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OfhZ5eNJ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OfhZ5eNJ"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLVvkl1866245
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:to; s=pp1; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZ
	G3hSuFU=; b=OfhZ5eNJ53AJ6dNpOya0CdZQVXFm6SZgwxAJ9eSDIdtyDZbKJ1KY
	v2yUYEVbwgLJ6bqhBA4yG+ZDIGh3xMvoGwng9OgQWHHbIuvooG0dgmwWJafj7ieU
	ytx0dqDN8eFs2+GDBEG+EGwJej+igF8ur7YoyzyBEvsx4KaqISsDDvl3ZiUiIQOc
	Z+BO9ns0NhjaInphMFkAtcGZNTDNfbkzEaj+c3BRHwECqtmkRuYRWZGMdorV9gFD
	HpI7uIf+F9cM1q4pNACwS5yvFwh6Xqvu7uv3N56R+wjntW5rNlEmtKfPMazjFtQJ
	Z5Ky00gph7+T4jTHD7qeh5G9UaYc7zdnrw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4g2fsqew66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:37:30 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67GLQJZS009155
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:37:29 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4g33eju4jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:37:28 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67GLanbX52494838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:36:49 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F5075805A
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:37:28 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])by IMSVA 
	(Postfix) with ESMTP id 1E76058051for <devicetree@vger.kernel.org>; Sun, 
	16 Aug 2026 21:37:28 +0000 (GMT)
Received: from [9.47.158.153] (unknown [9.47.158.153])by 
	smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPfor 
	<devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:37:28 +0000 (GMT)
Message-ID: <5ca2126e-d8cd-4307-9ffc-0499ff164e83@linux.ibm.com>
Date: Sun, 16 Aug 2026 17:37:27 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "devicetree+unsubscribe@vger.kernel.org" <devicetree@vger.kernel.org>
From: "Stefan Berger" <stefanb@linux.ibm.com>
Content-Type: text/plain;
	charset="UTF-8";
	format="flowed"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE3NSBTYWx0ZWRfX+KGcIcJl+9QN
 dj8DKxt3lAGOUqDMIOst2v2LAzSrobENBFqDSq/6g0K1vfM9JI++hFCxQuS87VgpHCGLZIxpHBR
 pxS7GahQG+n7SDBr5rXlx9PSpka05FFLXo9rEN7XbAYeipTzZm5aHgTN5LQi75+wgAn7cIzVrmu
 YbymQ/Thj6FETHtccoWiajnIHhjCPZwgHjmAB6HhjEFuiW3FtSPPlLecXnlVilX/fb8aVqc2aCE
 sBbrMfoTeMpVpIyZ/2N/q1XLhWeAtAabw/oIL/4eS6iK0usqPdd2ReQHZyF/hBw15gruxz/Q4c2
 hd7XcFRgDiHMQWaPWgKdyXBvDoYx8xNX26CBGwljtwz1215yaST/drFFX8NDX6rBCcRdYt0uB7b
 Nr3SsFrQzPbApK6vS/Ih3vf61HVXd9+L4CPH+HEwa1+Jljf5FjgyEc72PYZuELYxW15H8jE9qxm
 6WIPE3gIf7Fj29EVD4w==
X-Proofpoint-ORIG-GUID: cNjvchmLchchuR5-I75WBjtxTE5cvykr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE3NSBTYWx0ZWRfX+aLtGOh3eP9F
 ynOu8qZC+xaPzLJX80tzXxkpx/eQ+SHB6PE3HmDjSIQ/yEJkYPl8KORvZQJ7rnYZUbU+JlJCJmA
 NzR0dw1COjF8b4IH8WKkO92XaLZKZpQ=
X-Authority-Analysis: v=2.4 cv=DJe/JSNb c=1 sm=1 tr=0 ts=6a822d9a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=s5jvgZ67dGcA:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22
 a=tclcd6dtLQvEqt9_mmAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: cNjvchmLchchuR5-I75WBjtxTE5cvykr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160175


